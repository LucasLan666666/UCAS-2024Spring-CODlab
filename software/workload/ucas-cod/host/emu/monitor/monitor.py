import sys
import asyncio

from .checkpoint import Checkpoint
from .config import EmulatorConfig
from .control import Controller
from .devmem import DevMem
from .utils import *

class Monitor:
    def __init__(self, cfg: EmulatorConfig):
        self.__cfg = cfg

        self.__ctrl = Controller(cfg.ctrl.base, cfg.ctrl.size)
        self.__mem: dict[str, DevMem] = {}
        for seg in self.__cfg.memory:
            base = self.__cfg.memory[seg].base
            size = self.__cfg.memory[seg].size
            print("[EMU] Memory region: %08x - %08x (%s)" % (base, base + size, seg))
            self.__mem[seg] = DevMem(base, size)

        self.__ctrl.pause = True
        self.__ctrl.up_req = False
        self.__ctrl.down_req = False

        self.__putchar_task = None
        self.__putchar_running = False

        self.__stop_flag = False

    @property
    def mem(self):
        return self.__mem

    @property
    def cycle(self) -> int:
        return self.__ctrl.cycle

    @cycle.setter
    def cycle(self, value: int):
        self.__ctrl.cycle = value

    @property
    def reset(self) -> bool:
        return self.__ctrl.reset

    @reset.setter
    def reset(self, value: bool):
        self.__ctrl.reset = value

    def get_trigger_enable(self, key: int):
        return get_bit(self.__ctrl.trig_en, key)

    def set_trigger_enable(self, key: int, set: bool):
        value = set_bit(self.__ctrl.trig_en, key, set)
        self.__ctrl.trig_en = value

    def get_trigger_status(self, key: int):
        return get_bit(self.__ctrl.trig_stat, key)

    def stop(self):
        self.__stop_flag = True
        self.__ctrl.pause = True

    async def run_for(self, cycle: int):
        while cycle > 0:
            step = min(cycle, 0xffffffff)
            cycle -= step
            self.__ctrl.step = step
            self.__ctrl.pause = False

            while not self.__ctrl.pause:
                await asyncio.sleep(0.1)

            if self.__stop_flag:
                self.__stop_flag = False
                return False

            masked_trigger = self.__ctrl.trig_en & self.__ctrl.trig_stat
            if masked_trigger != 0:
                return False

        return True

    async def __go_up(self):
        self.__ctrl.up_req = True
        while not self.__ctrl.up_stat:
            await asyncio.sleep(0.1)
        self.__ctrl.up_req = False

    async def __go_down(self):
        self.__ctrl.down_req = True
        while not self.__ctrl.down_stat:
            await asyncio.sleep(0.1)
        self.__ctrl.down_req = False

    async def __dma_transfer(self, load: bool):
        self.__ctrl.dma_addr = 0
        self.__ctrl.dma_dir = load
        self.__ctrl.dma_start = True
        while self.__ctrl.dma_running:
            await asyncio.sleep(0.1)

    async def save(self, cp: Checkpoint):
        await self.__go_down()
        await self.__dma_transfer(False)
        cp.write_cycle(self.__ctrl.cycle)
        for seg in self.__mem:
            map = self.__mem[seg].mmap
            cp.write_file(seg, map)
        await self.__go_up()

    async def load(self, cp: Checkpoint):
        await self.__go_down()
        cp_cycle = cp.read_cycle()
        cycle = self.__ctrl.cycle
        if cp_cycle != cycle:
            print(f"[EMU] WARNING: checkpoint cycle {cp_cycle} differs from current cycle {cycle}")
        for seg in self.__mem:
            map = self.__mem[seg].mmap
            cp.read_file(seg, map)
        await self.__dma_transfer(True)
        await self.__go_up()

    async def init_state(self, init_mem: "dict[str, str]"):
        await self.__go_down()
        self.__ctrl.cycle = 0
        for seg in self.__mem:
            mem = self.__mem[seg]
            mem.zeroize()
            if seg in init_mem:
                file = init_mem[seg]
                print(f"[EMU] Initialize {seg} with file {file}")
                with open(file, 'rb') as f:
                    f.readinto(mem.mmap)
        await self.__dma_transfer(True)
        await self.__go_up()

    def __putchar(self):
        value = self.__ctrl.putchar
        if (value & (1 << 31)) != 0:
            char = value & 0xff
            sys.stdout.write(chr(char))
            sys.stdout.flush()
            return True
        return False

    async def __putchar_loop(self):
        self.__putchar_running = True
        while self.__putchar_running:
            await asyncio.sleep(0.1)
            while self.__putchar():
                pass

    async def putchar_start(self):
        self.__putchar_task = asyncio.create_task(self.__putchar_loop())

    async def putchar_stop(self):
        if self.__putchar_running:
            self.__putchar_running = False
            await self.__putchar_task
