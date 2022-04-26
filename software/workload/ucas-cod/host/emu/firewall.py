#!/usr/bin/env python3

import argparse
import time

from monitor import DevMem

FIREWALL_BASE               = 0x81020000

FIREWALL_SI_UNBLOCK         = 0x108
FIREWALL_SI_CMD_UNBLOCK     = (1 << 0)

FIREWALL_SI_FAULT_STATUS    = 0x100
SI_FAULT_WR_STATUS_MASK     = ((1 << 27) - (1 << 17))
SI_FAULT_RD_STATUS_MASK     = ((1 <<  7) - (1 <<  1))
WR_RESP_BUSY                = (1 << 16)
RD_RESP_BUSY                = (1 << 0)

def firewall_role(role_id: int):
    return FIREWALL_BASE + (role_id << 12)

parser = argparse.ArgumentParser()
parser.add_argument('role_id', type=int, help='role id')
parser.add_argument('--check', action='store_true', help='check firewall status')
parser.add_argument('--unblock', action='store_true', help='unblock firewall')
args = parser.parse_args()

devmem = DevMem(firewall_role(args.role_id), 0x1000)

if (args.check):
    print(f"[firewall] status: {hex(devmem.read_u32(FIREWALL_SI_FAULT_STATUS))}")

if (args.unblock):
    print('[firewall] waiting for firewall to be idle ...')
    while True:
        firewall_status = devmem.read_u32(FIREWALL_SI_FAULT_STATUS)
        if (firewall_status & (WR_RESP_BUSY | RD_RESP_BUSY)) == 0:
            break
        time.sleep(1)
    devmem.write_u32(FIREWALL_SI_UNBLOCK, FIREWALL_SI_CMD_UNBLOCK)
    print('[firewall] unblock firewall ok')
