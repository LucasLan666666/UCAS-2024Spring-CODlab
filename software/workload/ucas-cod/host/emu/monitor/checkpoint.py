import os
import bisect
import yaml
import gzip
from io import BytesIO
from shutil import copyfileobj, copytree
from typing import IO

class Checkpoint:

    def __init__(self, name: str):
        self.__name = name
        os.makedirs(name, exist_ok=True)

    def __enter__(self):
        return self

    def __exit__(self, type, value, tb):
        pass

    def read_file(self, name: str, file: IO[bytes]):
        gzipfile = gzip.GzipFile(self.__name + os.sep + name + '.gz', 'rb')
        file.seek(0)
        copyfileobj(gzipfile, file)
        gzipfile.close()

    def write_file(self, name: str, file: IO[bytes]):
        gzipfile = gzip.GzipFile(self.__name + os.sep + name + '.gz', 'wb')
        file.seek(0)
        copyfileobj(file, gzipfile)
        gzipfile.close()

    def read_data(self, name: str):
        file = BytesIO()
        self.read_file(name, file)
        return file.getvalue()

    def write_data(self, name: str, data: bytes):
        self.write_file(name, BytesIO(data))

    def read_cycle(self):
        return int.from_bytes(self.read_data('cycle'), 'little')

    def write_cycle(self, cycle: int):
        self.write_data('cycle', cycle.to_bytes(8, 'little'))

class CheckpointManager:

    def __init__(self, store_path: str):
        self.__path = store_path
        os.makedirs(store_path, exist_ok=True)
        self.__load_info()

    def __load_info(self):
        try:
            with open(self.__path + os.sep + 'cpmgr.yml', 'r') as f:
                info = yaml.load(f, Loader=yaml.Loader)
                self.__cycle_list = info['cycles']
        except IOError:
            self.__cycle_list = []

    def __save_info(self):
        with open(self.__path + os.sep + 'cpmgr.yml', 'w') as f:
            info = {
                'cycles': self.__cycle_list
            }
            yaml.dump(info, f, Dumper=yaml.Dumper)

    def __ckpt_name(self, cycle: int):
        return self.__path + os.sep + "%020d" % cycle

    def recent_saved_cycle(self, cycle: int):
        i = bisect.bisect_right(self.__cycle_list, cycle)
        if i == 0:
            raise ValueError
        return self.__cycle_list[i-1]

    def open(self, cycle: int):
        if not cycle in self.__cycle_list:
            bisect.insort(self.__cycle_list, cycle)
        self.__save_info()
        return Checkpoint(self.__ckpt_name(cycle))
