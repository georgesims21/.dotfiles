#!/usr/bin/env python3

import subprocess
import csv
import sys
import time

encoding = 'ascii'    # specify the encoding of the CSV data
p2 = subprocess.Popen(["clockify-cli", "show", "-v"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

output = p2.communicate()[0].decode(encoding)
reader = csv.DictReader(output.splitlines(), delimiter=",")
for row in reader:
    print('(' + row['project.name'] + ')',
        row['description'],
        "[" + row['duration'] + "]")
print("NOT RECORDING TIME!")
