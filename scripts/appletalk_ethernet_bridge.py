#!/usr/bin/env python3
import argparse, asyncio, fcntl, json, os, struct, sys
from typing import Optional
import websockets.asyncio

TUNSETIFF = 0x400454CA
IFF_TAP = 0x0002
IFF_NO_PI = 0x1000

def open_tap(name: str) -> int:
    fd = os.open("/dev/net/tun", os.O_RDWR)
    fcntl.ioctl(fd, TUNSETIFF, struct.pack("16sH", name.encode(), IFF_TAP | IFF_NO_PI))
    return fd

def mac_bytes_to_str(b: bytes) -> str:
    return ":".join(f"{x:02x}" for x in b)

def mac_str_to_bytes(s: str) -> bytes:
    parts = s.replace("-", ":").split(":")
    if len(parts) != 6 or any(len(p) != 2 for p in parts):
        raise ValueError(f"Bad MAC: {s}")
    return bytes(int(p, 16) for p in parts)

def is_unicast(mac: bytes) -> bool:
    return (mac[0] & 1) == 0

def is_appletalk(pkt: bytes) -> bool:
    """AppleTalk (EtherType 0x809B) or AARP (0x80F3),
    or SNAP-encapsulated (LLC AA:AA:03, OUI 00:00:00, EtherType 0x809B/0x80F3)."""
    if len(pkt) < 14:
        return False
    et = (pkt[12] << 8) | pkt[13]
    if et >= 0x0600:  # Ethernet II
        return et in (0x809B, 0x80F3)
    # 802.3 + LLC/SNAP
    if len(pkt) < 22:
        return False
    return (
        pkt[14:17] == b"\xAA\xAA\x03"
        and pkt[17:20] == b"\x00\x00\x00"
        and ((pkt[20] << 8) | pkt[21]) in (0x809B, 0x80F3)
    )

def is_do_ping(pkt: bytes) -> bool:
    """Heuristically drop Cloudflare DO diagnostic 'ping' frames."""
    if len(pkt) < 20:
        return False

    # 802.3 length vs EtherType
    length = (pkt[12] << 8) | pkt[13]
    if length >= 1500:
        return False

    dsap, ssap = pkt[14], pkt[15]
    if {dsap, ssap} != {0x70, 0x69}:
        return False

    # LLC control: I/S-frames have 2-byte control; U-frames have 1 byte.
    ctrl = pkt[16]
    ctrl_len = 2 if (ctrl & 0x01) == 0 else 1
    payload_start = 16 + ctrl_len

    # Look for "ping" (any case) near the start of the payload.
    pl = pkt[payload_start:payload_start + 4].lower()
    return b"ping" in pl

async def bridge(url: str, tap_name: str, mac_opt: Optional[str], ping: float, verbose: bool) -> None:
    loop = asyncio.get_running_loop()
    tap_fd = open_tap(tap_name)

    # Use an asyncio.Queue and a Unix fd reader (no threads)
    q_from_tap: asyncio.Queue[bytes] = asyncio.Queue(maxsize=2048)

    def _read_ready() -> None:
        try:
            pkt = os.read(tap_fd, 65535)
            if pkt:
                q_from_tap.put_nowait(pkt)
        except Exception as e:
            print(f"[tap] read error: {e}", file=sys.stderr)

    loop.add_reader(tap_fd, _read_ready)

    while True:  # reconnect loop
        try:
            async with websockets.connect(url, ping_interval=ping, max_size=None) as ws:
                if verbose:
                    print(f"[ws] connected {url} (subprotocol={getattr(ws, 'subprotocol', '')})")

                my_mac: Optional[bytes] = mac_str_to_bytes(mac_opt) if mac_opt else None
                init_sent = False

                async def send_init(reason: str) -> None:
                    nonlocal init_sent
                    if my_mac is None or init_sent:
                        return
                    await ws.send(json.dumps({"type": "init", "macAddress": mac_bytes_to_str(my_mac)}))
                    init_sent = True
                    if verbose:
                        print(f"[init] {mac_bytes_to_str(my_mac)} ({reason})")

                # If provided, register immediately
                if my_mac is not None:
                    await send_init("cli")

                async def tap_to_ws() -> None:
                    nonlocal my_mac
                    while True:
                        pkt = await q_from_tap.get()
                        if not is_appletalk(pkt):
                            if verbose:
                                print(f"[drop tap] non-AppleTalk len={len(pkt)}")
                            continue
                        # Learn our MAC from first valid AppleTalk frame’s source
                        if my_mac is None and is_unicast(pkt[6:12]):
                            my_mac = pkt[6:12]
                            await send_init("learned")
                        await send_init("post-learn")  # idempotent
                        msg = {
                            "type": "send",
                            "destination": mac_bytes_to_str(pkt[0:6]),
                            "packetArray": list(pkt),
                        }
                        await ws.send(json.dumps(msg))
                        if verbose:
                            print(f"[tap->ws] {len(pkt)}B → {mac_bytes_to_str(pkt[0:6])}")

                async def ws_to_tap() -> None:
                    async for raw in ws:
                        if isinstance(raw, (bytes, bytearray)):
                            if verbose:
                                print(f"[ws] unexpected binary {len(raw)}B (ignored)")
                            continue
                        try:
                            data = json.loads(raw)
                        except Exception:
                            if verbose:
                                print(f"[ws] non-JSON: {raw!r}")
                            continue
                        if data.get("type") == "receive":
                            pkt = bytes(data.get("packetArray", []))
                            if pkt:
                                if is_do_ping(pkt):
                                    if verbose:
                                        print("[ws->tap] dropped DO ping")
                                    continue
                                os.write(tap_fd, pkt)
                                if verbose and len(pkt) >= 12:
                                    d, s = pkt[0:6], pkt[6:12]
                                    print(f"[ws->tap] {len(pkt)}B ← {mac_bytes_to_str(s)} → {mac_bytes_to_str(d)}")
                        elif verbose and "type" in data:
                            print(f"[ws] {data}")

                await asyncio.gather(tap_to_ws(), ws_to_tap())

        except Exception as e:
            if verbose:
                print(f"[ws] error/disconnect: {e}; retrying in 1s…", file=sys.stderr)
            await asyncio.sleep(1.0)

def main() -> None:
    ap = argparse.ArgumentParser(description="Bridge TAP <-> Infinite Mac Durable Object (AppleTalk only).")
    ap.add_argument("--tap", default="atalk0", help="TAP interface name (pre-created & up)")
    ap.add_argument("--url", required=True, help="WebSocket URL, e.g. wss://infinitemac.org/zone/demo/websocket")
    ap.add_argument("--mac", help="MAC to register via 'init' (e.g. 02:00:00:aa:bb:cc); else learn from first AppleTalk src")
    ap.add_argument("--ping", type=float, default=20.0, help="WebSocket ping interval seconds")
    ap.add_argument("-v", "--verbose", action="store_true", help="Verbose logs")
    args = ap.parse_args()

    try:
        asyncio.run(bridge(args.url, args.tap, args.mac, args.ping, args.verbose))
    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
