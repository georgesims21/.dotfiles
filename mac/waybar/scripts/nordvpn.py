#!/usr/bin/env python3

import subprocess
import sys

encoding = 'ascii'    # specify the encoding of the CSV data
p2 = subprocess.Popen(["/usr/bin/nordvpn", "status"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
output = p2.communicate()[0].decode(encoding)
arr = output.splitlines()
full_status = arr[12]

if full_status == 'Status: Disconnected':
    print(full_status)
    sys.exit(1)

vpn_state = {
    'status' : arr[12].split(": ")[-1],
    'server' : arr[13].split(": ")[-1],
    'location' : arr[14].split(": ")[-1],
    'city' : arr[15].split(": ")[-1],
    'ip' : arr[16].split(": ")[-1]
}

print(f"{vpn_state['city']}, {vpn_state['location']}")
sys.exit(0)
