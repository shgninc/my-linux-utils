#!/usr/bin/env python3

from __future__ import print_function
import random

# loop
fnames = "names.list"
fpass = "pass.list"
names = open(fnames).read().splitlines()
passs = open(fpass).read().splitlines()
quota = 2048

for num in range(len(names)):
    list = [passs,passs,passs,passs]
    passw = ' '.join([random.choice(i) for i in list])
    print(passw)

