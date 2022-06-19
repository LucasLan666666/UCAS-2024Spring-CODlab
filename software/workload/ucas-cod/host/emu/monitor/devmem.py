import os
import mmap
import numpy as np

class DevMem:
    def __init__(self, base: int, size: int):
        euid = os.geteuid()
        if euid != 0:
            raise EnvironmentError('Root permissions required.')

        self.__base = base
        self.__size = size

        self.__file = os.open('/dev/mem', os.O_RDWR | os.O_SYNC)
        self.__mmap = mmap.mmap(self.__file, size,
                                mmap.MAP_SHARED, mmap.PROT_READ | mmap.PROT_WRITE,
                                offset=base)
        self.__u8   = np.frombuffer(self.__mmap, np.uint8, size)
        self.__u32  = np.frombuffer(self.__mmap, np.uint32, size >> 2)

    def __del__(self):
        self.__u8 = None
        self.__u32 = None
        self.__mmap.close()
        os.close(self.__file)

    @property
    def base(self):
        return self.__base

    @property
    def size(self):
        return self.__size

    @property
    def mmap(self):
        return self.__mmap

    def read_bytes(self, offset, n):
        return bytes(self.__u8[offset : offset + n])

    def write_bytes(self, offset, b):
        self.__u8[offset : offset + len(b)] = np.frombuffer(b, np.uint8)

    def read_u32(self, offset):
        return int(self.__u32[offset >> 2])

    def write_u32(self, offset, value):
        self.__u32[offset >> 2] = np.uint32(value)

    def zeroize(self):
        self.__u32.fill(0)
