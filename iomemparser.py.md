#/usr/bin/env python3

import sys

filepath = sys.argv[1]

with open(filepath) as fp:  
   line = fp.readline()
   cnt = 1
   while line:
       mem=line.split(':')[0]
       start,end=mem.split('-')
       start=int("0x" + start.strip(), 16)
       end=int("0x" + end.strip(), 16)
       size=end-start
       fmt="MiB"
       hsize=size >> 20
       if hsize==0:
          fmt="kiB"
          hsize=size >> 10
       print("{} {} {}".format(line.strip(), hsize,fmt))
       line = fp.readline()
       cnt += 1