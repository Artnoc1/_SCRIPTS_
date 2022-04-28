#/usr/bin/env python3

import sys

filepath = sys.argv[1]

with open(filepath) as fp:  
   line = fp.readline()
   cnt = 1
   while line:
       mem=line.split(':')

       print("{} {}".format(line,mem))
       line = fp.readline()
       cnt += 1