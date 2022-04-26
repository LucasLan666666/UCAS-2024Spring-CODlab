import argparse
import asyncio

from . import CheckpointManager
from . import EmulatorConfig
from . import Emulator
from . import ResetEvent

async def emu_main():
    parser = argparse.ArgumentParser()
    parser.add_argument('config', help='scan chain configuration file')
    parser.add_argument('checkpoint', help='checkpoint storage path')
    parser.add_argument('--initmem', nargs=2, metavar=('name', 'file'), action='append', default=[], help='load memory from file for initialization')
    parser.add_argument('--timeout', metavar='cycle', type=int, action='store', help='set timeout cycles')
    parser.add_argument('--period', metavar='cycle', type=int, action='store', default=0, help='set checkpoint period (0 to disable)')
    parser.add_argument('--to', metavar='cycle', type=int, action='store', help='go to specified cycle from initial state')
    parser.add_argument('--rewind', metavar='cycle', type=int, action='store', help='go to specified cycle from a recent checkpoint')
    parser.add_argument('--dump', metavar='path', action='store', help='specify dump file name')
    args = parser.parse_args()

    cfg = EmulatorConfig(args.config)
    ckptmgr = CheckpointManager(args.checkpoint)
    emu = Emulator(cfg, ckptmgr)

    for initmem in args.initmem:
        emu.init_mem_add(initmem[0], initmem[1])

    emu.init_event_add(ResetEvent(0, 1))
    emu.init_event_add(ResetEvent(10, 0))

    if args.to != None:
        emu.disable_user_trig()
        await emu.run(args.period, args.to)
    else:
        emu.enable_user_trig()
        await emu.run(args.period, args.timeout)

    if args.rewind != None:
        cycle = emu.cycle - args.rewind
        if cycle < 0:
            cycle = 0
        await emu.rewind(cycle)

    if args.dump != None:
        await emu.save(args.dump)

    emu.close()

asyncio.run(emu_main())
