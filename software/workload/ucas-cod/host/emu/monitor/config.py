import yaml

class AddressRegion:
    def __init__(self, base: int, size: int):
        self.base = base
        self.size = size

class EmulatorConfig:
    def __init__(self, plat_yml: str):
        with open(plat_yml, 'r') as f:
            config = yaml.load(f, Loader=yaml.Loader)
            self.__parse_plat_cfg(config)

    def __parse_plat_cfg(self, cfg):
        ctrl = cfg['ctrl']
        self.ctrl = AddressRegion(ctrl['base'], ctrl['size'])

        memory = cfg['memory']
        self.memory = {}
        for seg in memory:
            name = seg['name']
            self.memory[name] = AddressRegion(seg['base'], seg['size'])
