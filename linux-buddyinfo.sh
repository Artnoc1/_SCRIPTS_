#!/usr/bin/env sh

# awk script to view number of free pages
# adjust the page power accordingly, default is 3, which is 4kiB.

awk -v pgpw=3 '{print $4} {pfree=0;tfree=0; for(i=5;i<=NF;i++) {pgs=2^(i-pgpw);pfree=$i*pgs;tfree+=pfree; print $i " * " pgs "kiB = " pfree "kiB";}} {print "Total Free: " tfree "kiB"}' /proc/buddyinfo
