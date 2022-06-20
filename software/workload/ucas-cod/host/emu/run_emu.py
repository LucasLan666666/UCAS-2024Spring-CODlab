import argparse
import asyncio
import sys

from monitor import *

class TurboTraceCmpCtrl:
    def __init__(self, mem_base: int, mmio_base: int):
        self.mem = DevMem(mem_base + 0x20000000, 0x10000000)
        self.ctrl = DevMem(mmio_base + 0x00020000, 0x10000)

    def load_mem(self, file: str):
        self.mem.zeroize()
        with open(file, 'rb') as f:
            f.readinto(self.mem.mmap)

    @property
    def enable(self):
        return self.ctrl.read_u32(0x4) != 0

    @enable.setter
    def enable(self, val: bool):
        self.ctrl.write_u32(0x4, 0x0 if val else 0x3)

    @property
    def rdata_fifo_full(self):
        return self.ctrl.read_u32(0x0) & 0x4

    @property
    def rdata_fifo_empty(self):
        return self.ctrl.read_u32(0x0) & 0x2

    @property
    def trace_mismatch(self):
        return self.ctrl.read_u32(0x0) & 0x1

    @property
    def dut_pc(self):
        return self.ctrl.read_u32(0x10)

    @property
    def dut_wdata(self):
        return self.ctrl.read_u32(0x14)

    @property
    def dut_waddr(self):
        return self.ctrl.read_u32(0x18)

    @property
    def ref_pc(self):
        return self.ctrl.read_u32(0x20)

    @property
    def ref_wdata(self):
        return self.ctrl.read_u32(0x24)

    @property
    def ref_waddr(self):
        return self.ctrl.read_u32(0x28)

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
    parser.add_argument('--turbo', action='store_true', help='enable turbo trace comparison')
    args = parser.parse_args()

    cfg = EmulatorConfig(args.config)
    ckptmgr = CheckpointManager(args.checkpoint)

    def setup_emu():
        emu = Emulator(cfg, ckptmgr)

        for initmem in args.initmem:
            emu.init_mem_add(initmem[0], initmem[1])

        emu.init_event_add(ResetEvent(0, 1))
        emu.init_event_add(ResetEvent(10, 0))

        return emu

    emu = setup_emu()

    # workaround: the configuration file does not store memory base so the base of emu_top.u_rammodel.host_axi is used
    turbo = TurboTraceCmpCtrl(cfg.memory['emu_top.u_rammodel.host_axi'].base, cfg.ctrl.base)
    if args.turbo:
        for initmem in args.initmem:
            if initmem[0] == 'emu_top.u_rammodel.host_axi':
                turbo.load_mem(initmem[1])
        turbo.enable = True
    else:
        turbo.enable = False

    async def emu_run_task():
        if args.to != None:
            emu.disable_user_trig()
            await emu.run(args.period, args.to)
        else:
            emu.enable_user_trig()
            await emu.run(args.period, args.timeout)

    async def turbo_check_task():
        print(f'[TURBO] Trace comparison enabled', file=sys.stderr)
        while not turbo.trace_mismatch:
            await asyncio.sleep(0.1)
        print('******************** Turbo CPU Commit Trace Mismatch ********************', file=sys.stderr)
        print('Yours:      PC = 0x%08x, RF_waddr = 0x%02x, RF_wdata = 0x%08x' % (turbo.dut_pc, turbo.dut_waddr, turbo.dut_wdata), file=sys.stderr)
        print('Reference:  PC = 0x%08x, RF_waddr = 0x%02x, RF_wdata = 0x%08x' % (turbo.ref_pc, turbo.ref_waddr, turbo.ref_wdata), file=sys.stderr)
        print('*************************************************************************', file=sys.stderr)

    async def timeout_task(timeout=300):
        print(f'[TURBO] Timeout is set to {timeout} seconds', file=sys.stderr)
        await asyncio.sleep(timeout)
        print(f'*** Timeout: Benchmark execution does not finish after {timeout} seconds', file=sys.stderr)

    tasks: list[asyncio.Task] = []
    tasks.append(asyncio.create_task(emu_run_task()))
    tasks.append(asyncio.create_task(turbo_check_task()))
    tasks.append(asyncio.create_task(timeout_task()))
    await asyncio.wait(tasks, return_when=asyncio.FIRST_COMPLETED)
    for t in tasks:
        t.cancel()
    await asyncio.sleep(0)

    turbo.enable = False
    cycle = emu.cycle
    print(f'Stopped at cycle {cycle}', file=sys.stderr)

    # workaround: check if any checkpoint is saved to judge if the fpga board is faulty
    try:
        ckptmgr.recent_saved_cycle(0)
    except ValueError:
        print('ERROR: no checkpoint is sucessfully saved which is possibly a platform fault. Please contact the administrator.', file=sys.stderr)
        exit(1)

    emu = setup_emu()

    if args.rewind != None:
        cycle = cycle - args.rewind
        if cycle < 0:
            cycle = 0
        await emu.rewind(cycle)

    if args.dump != None:
        await emu.save(args.dump)

    emu.close()

asyncio.run(emu_main())
