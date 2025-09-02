#!/usr/bin/env python3
import argparse, asyncio, base64, fcntl, json, os, struct, subprocess, sys, threading
import websockets.asyncio

TUNSETIFF = 0x400454ca
IFF_TAP   = 0x0002
IFF_NO_PI = 0x1000

def create_tap(name: str) -> int:
    fd = os.open("/dev/net/tun", os.O_RDWR)
    ifr = struct.pack("16sH", name.encode(), IFF_TAP | IFF_NO_PI)
    ifs = fcntl.ioctl(fd, TUNSETIFF, ifr)
    actual = ifs[:16].split(b"\x00", 1)[0].decode()
    if actual != name:
        print(f"[warn] kernel gave us {actual}, not {name}")
    return fd

class RawCodec:
    @staticmethod
    def enc(frame: bytes): return frame             # send as binary
    @staticmethod
    def dec(msg): return msg if isinstance(msg, (bytes, bytearray)) else None

class JsonBase64Codec:
    # Example alternate framing: {"t":"pkt","d":"...base64..."}
    @staticmethod
    def enc(frame: bytes):
        return json.dumps({"t":"pkt","d":base64.b64encode(frame).decode("ascii")})
    @staticmethod
    def dec(msg):
        if isinstance(msg, str):
            obj = json.loads(msg)
            if obj.get("t") == "pkt":
                return base64.b64decode(obj["d"])
        return None

async def bridge(tap_fd: int, ws_url: str, codec, ping_interval: float, verbose: bool):
    loop = asyncio.get_running_loop()
    q = asyncio.Queue(maxsize=1024)

    # blocking TAP reader -> async queue
    def tap_reader():
        while True:
            try:
                pkt = os.read(tap_fd, 65535)
                asyncio.run_coroutine_threadsafe(q.put(pkt), loop)
            except Exception as e:
                print(f"[tap->ws] read error: {e}", file=sys.stderr)
                break

    threading.Thread(target=tap_reader, daemon=True).start()

    while True:  # reconnect loop
        try:
            async with websockets.connect(ws_url, ping_interval=ping_interval, max_size=None) as ws:
                print(f"[ws] connected to {ws_url}")

                async def pump_tap_to_ws():
                    while True:
                        pkt = await q.get()
                        await ws.send(codec.enc(pkt))
                        if verbose:
                            print(f"[tap->ws] {len(pkt)} bytes")

                async def pump_ws_to_tap():
                    async for msg in ws:
                        pkt = codec.dec(msg)
                        if pkt is None:
                            continue
                        os.write(tap_fd, pkt)
                        if verbose:
                            print(f"[ws->tap] {len(pkt)} bytes")

                await asyncio.gather(pump_tap_to_ws(), pump_ws_to_tap())

        except Exception as e:
            print(f"[ws] disconnected/error: {e} — reconnecting in 1s…", file=sys.stderr)
            await asyncio.sleep(1.0)

def main():
    ap = argparse.ArgumentParser(description="Bridge a TAP interface to an Infinite Mac AppleTalk WebSocket")
    ap.add_argument("--tap", default="atalk0", help="TAP interface name (default: atalk0)")
    ap.add_argument("--url", required=True, help="WebSocket URL (e.g. wss://infinitemac.org/zone/demo/websocket)")
    ap.add_argument("--mtu", type=int, default=1500, help="MTU for TAP (default: 1500)")
    ap.add_argument("--codec", choices=["raw", "jsonb64"], default="raw", help="Framing used on the WebSocket")
    ap.add_argument("-v", "--verbose", action="store_true")
    ap.add_argument("--ping", type=float, default=20.0, help="WS ping interval seconds (default: 20)")
    args = ap.parse_args()

    tap_fd = create_tap(args.tap)
    codec = RawCodec if args.codec == "raw" else JsonBase64Codec

    try:
        asyncio.run(bridge(tap_fd, args.url, codec, args.ping, args.verbose))
    finally:
        os.close(tap_fd)

if __name__ == "__main__":
    main()
