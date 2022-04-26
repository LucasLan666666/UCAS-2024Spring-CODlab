from .devmem import DevMem
from .utils import *

EMU_STAT                = 0x000
EMU_CYCLE_LO            = 0x008
EMU_CYCLE_HI            = 0x00c
EMU_STEP                = 0x010
EMU_CKPT_SIZE           = 0x014
EMU_TRIG_STAT           = 0x018
EMU_TRIG_EN             = 0x01c
EMU_DMA_ADDR_LO         = 0x020
EMU_DMA_ADDR_HI         = 0x024
EMU_DMA_STAT            = 0x028
EMU_DMA_CTRL            = 0x02c
EMU_PUTCHAR             = 0x080

EMU_STAT_PAUSE          = 0
EMU_STAT_DUT_RESET      = 1
EMU_STAT_UP_REQ         = 2
EMU_STAT_DOWN_REQ       = 3
EMU_STAT_UP_STAT        = 4
EMU_STAT_DOWN_STAT      = 5
EMU_STAT_STEP_TRIG      = 31
EMU_DMA_STAT_RUNNING    = 0
EMU_DMA_CTRL_START      = 0
EMU_DMA_CTRL_DIRECTION  = 1

class Controller:
    def __init__(self, base: int, size: int):
        self.__ctrlmap = DevMem(base, size)

    def read_csr(self, offset: int):
        return self.__ctrlmap.read_u32(offset)

    def write_csr(self, offset: int, value: int):
        if value < 0 or value >= (1 << 32):
            raise ValueError
        self.__ctrlmap.write_u32(offset, value)

    def __read_csr_64(self, off_lo: int, off_hi: int):
        lo = self.read_csr(off_lo)
        hi = self.read_csr(off_hi)
        return (hi << 32) | lo

    def __write_csr_64(self, off_lo: int, off_hi: int, value: int):
        if type(value) != int or value < 0 or value >= (1 << 64):
            raise ValueError
        lo = value & ((1 << 32) - 1)
        hi = value >> 32
        self.write_csr(off_lo, lo)
        self.write_csr(off_hi, hi)

    def __get_csr_bit(self, csr: int, bit: int):
        if type(bit) != int or bit < 0 or bit >= 32:
            raise ValueError
        return get_bit(self.read_csr(csr), bit)

    def __set_csr_bit(self, csr: int, bit: int, set: bool):
        if type(bit) != int or bit < 0 or bit >= 32:
            raise ValueError
        value = set_bit(self.read_csr(csr), bit, set)
        self.write_csr(csr, value)

    def __make_ro_csr_prop(csr: int):
        def getter(self):
            return self.read_csr(csr)
        return property(getter)

    def __make_rw_csr_prop(csr: int):
        def getter(self):
            return self.read_csr(csr)
        def setter(self, value):
            self.write_csr(csr, value)
        return property(getter, setter)

    def __make_ro_csr_64_prop(csr_lo: int, csr_hi: int):
        def getter(self):
            return self.__read_csr_64(csr_lo, csr_hi)
        return property(getter)

    def __make_rw_csr_64_prop(csr_lo: int, csr_hi: int):
        def getter(self):
            return self.__read_csr_64(csr_lo, csr_hi)
        def setter(self, value):
            self.__write_csr_64(csr_lo, csr_hi, value)
        return property(getter, setter)

    def __make_ro_bit_prop(csr: int, bit: int):
        def getter(self):
            return self.__get_csr_bit(csr, bit)
        return property(getter)

    def __make_rw_bit_prop(csr: int, bit: int):
        def getter(self):
            return self.__get_csr_bit(csr, bit)
        def setter(self, value):
            self.__set_csr_bit(csr, bit, value)
        return property(getter, setter)

    pause       = __make_rw_bit_prop(EMU_STAT, EMU_STAT_PAUSE)
    reset       = __make_rw_bit_prop(EMU_STAT, EMU_STAT_DUT_RESET)
    up_req      = __make_rw_bit_prop(EMU_STAT, EMU_STAT_UP_REQ)
    down_req    = __make_rw_bit_prop(EMU_STAT, EMU_STAT_DOWN_REQ)
    up_stat     = __make_ro_bit_prop(EMU_STAT, EMU_STAT_UP_STAT)
    down_stat   = __make_ro_bit_prop(EMU_STAT, EMU_STAT_DOWN_STAT)
    step_trig   = __make_ro_bit_prop(EMU_STAT, EMU_STAT_STEP_TRIG)

    cycle       = __make_rw_csr_64_prop(EMU_CYCLE_LO, EMU_CYCLE_HI)
    step        = __make_rw_csr_prop(EMU_STEP)
    ckpt_size   = __make_ro_csr_prop(EMU_CKPT_SIZE)
    trig_stat   = __make_ro_csr_prop(EMU_TRIG_STAT)
    trig_en     = __make_rw_csr_prop(EMU_TRIG_EN)
    putchar     = __make_ro_csr_prop(EMU_PUTCHAR)

    dma_addr    = __make_rw_csr_64_prop(EMU_DMA_ADDR_LO, EMU_DMA_ADDR_HI)
    dma_running = __make_ro_bit_prop(EMU_DMA_STAT, EMU_DMA_STAT_RUNNING)
    dma_start   = __make_rw_bit_prop(EMU_DMA_CTRL, EMU_DMA_CTRL_START)
    dma_dir     = __make_rw_bit_prop(EMU_DMA_CTRL, EMU_DMA_CTRL_DIRECTION)
