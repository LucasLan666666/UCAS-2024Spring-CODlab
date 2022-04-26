def get_bit(value: int, bit: int):
    if type(bit) != int or bit < 0 or bit >= 32:
        raise ValueError
    return (value & (1 << bit)) != 0

def set_bit(value: int, bit: int, set: bool):
    if type(bit) != int or bit < 0 or bit >= 32:
        raise ValueError
    if set:
        value |= (1 << bit)
    else:
        value &= ~(1 << bit)
    return value
