"""Run headless battles by executing original Robot Warriors and Mac IIci ROM code.

The public function is ``run_battle(request, *, provenance=None)``. Its result
matches the native ``battle`` JSON protocol. The original region-selection,
robot-initialization, compiler, virtual CPU, movement, shell/death and victory
accounting instructions execute unchanged. Only presentation is omitted.

For explicit positions, hardware defaults are fixture inputs and no placement
random numbers are consumed. After initialization, a zero-budget CPU call updates
NUM_ROBOTS for the time-zero snapshot: it executes no virtual instructions, consumes
no RNG samples, and advances no simulation time. ``stop_when_finished`` defaults
to false, matching the native JSON protocol. Completion is
checked after a full tick, rather than reproducing the GUI's 50-tick victory
presentation countdown or its 300 damage-free-tick timeout. The original one-time
victory accounting block still runs. Subsequent fixed ticks omit that countdown.

The corrected emulator must be selected explicitly as documented in
reverse/emulation.md. This module neither installs packages nor changes sys.path.
"""
from __future__ import annotations

import machine68k

from oracle import A5, ROBOT, STACK, OriginalMachine, long, word
from platform_sane import RomNumericalPlatform

_ROBOT_STRIDE = 0x3000
_HANDLE_BASE = 0x500000
_REGION_FRAME = 0x510000
_MAIN_FRAME = 0x520000
_QD_GLOBALS = 0x580000
_PORT = 0x600000


def _int(value, name, low, high):
    if isinstance(value, bool) or not isinstance(value, int) or not low <= value <= high:
        raise ValueError(f'{name} must be an integer in {low}..{high}')
    return value


def _source(item, index):
    name = item.get('name', 'robot')
    if not isinstance(name, str):
        raise ValueError(f'Robot {index + 1} name must be a string')
    if ('source' in item) == ('source_hex' in item):
        raise ValueError(f'{name}: supply exactly one of source and source_hex')
    if 'source_hex' in item:
        encoded = item['source_hex']
        if not isinstance(encoded, str) or len(encoded) % 2:
            raise ValueError(f'{name}: source_hex must contain complete hexadecimal bytes')
        if any(c not in '0123456789abcdefABCDEF' for c in encoded):
            raise ValueError(f'{name}: source_hex contains a non-hexadecimal character')
        raw = bytes.fromhex(encoded)
    else:
        source = item['source']
        if not isinstance(source, str):
            raise ValueError(f'{name}: source must be a string')
        try:
            raw = source.encode('mac_roman')
        except UnicodeEncodeError as error:
            raise ValueError(f'{name}: source is not representable in Mac Roman at character {error.start}') from None
    if len(raw) > 32767:
        raise ValueError(f'{name}: original compiler input exceeds 32767 bytes')
    # Source bytes are exact. File wrappers perform line-ending normalization.
    return name, raw.decode('mac_roman')


def _checkpoint(m, start, end, frame=_MAIN_FRAME):
    m.cpu.w_sp(STACK)
    m.cpu.w_reg(machine68k.Register.A6, frame)
    m.run_until(3, start, end)


def _initialize(m, platform, items, compiled, seed, explicit):
    m.reset()
    m.mem.clear_block(ROBOT, _ROBOT_STRIDE * 5, 0)
    m.mem.clear_block(0x500000, 0x100000, 0)
    m.mem.w32(A5, _QD_GLOBALS)
    m.mem.w32(_QD_GLOBALS - 0x7e, seed)
    m.toolbox_handlers[0xa861] = platform.rom_trap
    m.mem.w32(A5 - 0x41da, _PORT)
    for i, value in enumerate((0, 0, 314, 382)):
        m.mem.w16(_PORT + 0x10 + 2 * i, value)
    m.mem.w16(A5 - 0x3c7e, len(items))
    # Sound/trace/display globals remain disabled. The original death routine's
    # frame-local display-table entries are zero, so it skips GUI painting.
    m.mem.w16(_MAIN_FRAME - 0x3fa, 50)
    m.cpu.w_sp(STACK)
    m.cpu.w_reg(machine68k.Register.A6, _REGION_FRAME)
    m.cpu.w_reg(machine68k.Register.D7, 0)
    m.run_until(2, 0x88, 0x108)
    for i, (item, program) in enumerate(zip(items, compiled)):
        base = ROBOT + i * _ROBOT_STRIDE
        handle = _HANDLE_BASE + 4 * i
        slot = i + 1
        m.mem.w32(handle, base)
        m.mem.w32(A5 - 0x3fd0 + slot * 0xa6, handle)
        m.mem.w8(A5 - 0x3c8b + slot, 1)
        m.mem.w8(A5 - 0x3c85 + slot, 1)
        m.mem.w16(base + 0x22b4, slot)
        attrs = program['attributes']
        for j, value in enumerate(attrs):
            m.mem.w16(base + 0x11c + 2 * j, value)
        m.mem.w_block(base + 0x12c, bytes.fromhex(program['code_hex']))
        m.mem.w16(base + 0x2070, program['code_count'])
        if explicit:
            x, y = item['x'], item['y']
            m.mem.w16(base + 0x2072, x)
            m.mem.w16(base + 0x2074, y)
            for j, value in enumerate((y - 5, x - 5, y + 6, x + 6)):
                m.mem.w16(base + 0x22a4 + 2 * j, value)
                m.mem.w16(base + 0x22ac + 2 * j, value)
            m.mem.w16(base + 0x2080, (1850, 2500, 3200)[attrs[4]])
            m.mem.w16(base + 0x227e, (100, 115, 130, 145, 165, 200)[attrs[6]])
            m.mem.w16(base + 0x2280, (1850, 2500, 3200)[attrs[4]])
            m.mem.w16(base + 0x2282, (200, 310, 500)[attrs[3]])
            m.call(3, 0xd70, long(base + 0x11c))
        else:
            # The used-region bytes in this original caller frame persist across
            # robots. Original Random chooses an unused region, then 0e08 draws
            # the x/y coordinates and initializes the entire CPU/hardware record.
            m.cpu.w_reg(machine68k.Register.A4, _MAIN_FRAME)
            _checkpoint(m, 0x39a0, 0x39c0, _REGION_FRAME)
            region = m.cpu.r32_reg(machine68k.Register.D6) & 0xffff
            m.call(3, 0xe08, word(region) + long(base + 0x11c) + word(1))
    # Keep the same useful time-zero proximity-register snapshot as native.
    for i in range(len(items)):
        m.call(3, 0x1af0, word(0) + word(0) + long(ROBOT + i * _ROBOT_STRIDE + 0x11c), 2)


def _tick(m, compiled):
    old_alive = m.mem.r16(A5 - 0x3c7e)
    for i, program in enumerate(compiled):
        if not m.mem.r8(A5 - 0x3c8b + i + 1):
            continue
        base = ROBOT + i * _ROBOT_STRIDE
        budget = (100 << program['attributes'][0]) - m.mem.r16s(base + 0x222c)
        m.call(3, 0x1af0, word(0x100) + word(budget) + long(base + 0x11c), 2)
    m.call(3, 0x880, word(0) + long(_MAIN_FRAME - 0x435))
    m.call(3, 0x2cb8, long(_MAIN_FRAME) + word(0) + word(0x100))
    # The enclosing original battle loop awards survival points after *all*
    # deaths for this tick, then records a win once when <=1 robot survives.
    m.mem.w16(_MAIN_FRAME - 0x3f4, old_alive)
    _checkpoint(m, 0x4b9c, 0x4c10)
    if m.mem.r16(_MAIN_FRAME - 0x3fa) == 50:
        _checkpoint(m, 0x4c64, 0x4cce)


def _snapshot(m, names, ticks, include_seed):
    robots = []
    for i, name in enumerate(names):
        base = ROBOT + i * _ROBOT_STRIDE
        robots.append({
            'name': name,
            'active': bool(m.mem.r8(A5 - 0x3c8b + i + 1)),
            'registers': [m.mem.r16s(base + 0x2072 + 2 * j) for j in range(19)],
            'pc': m.mem.r16s(base + 0x222a),
            'accumulator': m.mem.r16s(base + 0x2230),
            'memory': [m.mem.r16s(base + 0x2098 + 2 * j) for j in range(201)],
            'stack_pointer': m.mem.r16s(base + 0x222e),
            'cycle_debt': m.mem.r16s(base + 0x222c),
            'error_resets': m.mem.r32s(base + 0x22d4),
            'velocity': [m.mem.r16s(base + 0x2272), m.mem.r16s(base + 0x2274)],
            'score': m.mem.r32s(base + 0x22bc),
            'raw_damage': m.mem.r16s(base + 0x2284),
            'shell_active': bool(m.mem.r8(base + 0x228a)),
        })
    result = {'tick': ticks, 'alive': sum(robot['active'] for robot in robots),
              'robots': robots, 'events': []}
    if include_seed:
        result['rng_seed'] = m.mem.r32(_QD_GLOBALS - 0x7e)
    return result


def run_battle(request: dict, *, provenance: dict | None = None) -> dict:
    """Execute a 2–5 robot battle; optionally populate an execution-evidence dict.

    ``robots`` contain ``name`` and exactly one of ``source``/``source_hex``.
    All robots must either provide ``x`` and ``y`` or omit both. ``ticks`` defaults
    to 1000, ``seed`` to 1, and ``include_rng_seed`` to false. Event collection is
    a native presentation extension; this original-code backend returns events[].
    """
    items = request.get('robots')
    if not isinstance(items, list) or not 2 <= len(items) <= 5:
        raise ValueError('A battle needs two to five robots')
    if not all(isinstance(item, dict) for item in items):
        raise ValueError('Every robot must be an object')
    ticks = _int(request.get('ticks', 1000), 'ticks', 0, 1_000_000)
    seed = _int(request.get('seed', 1), 'seed', 0, 0xffffffff)
    explicit = all('x' in item and 'y' in item for item in items)
    generated = all('x' not in item and 'y' not in item for item in items)
    if not explicit and not generated:
        raise ValueError('Supply x and y for every robot, or omit both for every robot')
    if generated and seed % 0x7fffffff == 0:
        raise ValueError('This seed cannot select distinct original placement regions')
    if request.get('events', False):
        raise ValueError('Event collection is not available in the original-code backend')
    if explicit:
        for item in items:
            _int(item['x'], 'x', 5, 376)
            _int(item['y'], 'y', 5, 308)
    names, sources = zip(*(_source(item, i) for i, item in enumerate(items)))
    m = OriginalMachine(cpu_type=machine68k.CPUType.M68030)
    try:
        platform = RomNumericalPlatform(m)
        compiled = []
        for name, source in zip(names, sources):
            result = m.compile(source)
            if result['error']:
                raise ValueError(f"{name}: {result['error']} (source offset {result['error_position']})")
            compiled.append(result)
        _initialize(m, platform, items, compiled, seed, explicit)
        completed = 0
        for _ in range(ticks):
            _tick(m, compiled)
            completed += 1
            if request.get('stop_when_finished', False) and m.mem.r16(A5 - 0x3c7e) <= 1:
                break
        result = _snapshot(m, names, completed, request.get('include_rng_seed', False))
        # This also asserts application and ROM code bytes remain unchanged.
        evidence = m.provenance()
        if provenance is not None:
            provenance.update({'execution': evidence, 'platform': platform.provenance(),
                               'entry_points': ['CODE5:24dc', 'CODE2:0088..0108',
                                                'CODE3:39a0..39c0', 'CODE3:0e08',
                                                'CODE3:0d70', 'CODE3:1af0',
                                                'CODE3:0880', 'CODE3:2cb8',
                                                'CODE3:4b9c..4c10', 'CODE3:4c64..4cce'],
                               'placement': 'explicit fixtures' if explicit else 'original region rejection and ROM Random',
                               'time_zero': 'original zero-budget CPU refresh; no virtual instruction, tick, or RNG consumption'})
        return result
    finally:
        m.close()
