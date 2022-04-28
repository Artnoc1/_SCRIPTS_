#!/bin/bash 

max_lts=100

while sleep 1; do
lts="$(ping -qc1 google.com 2>&1)"
png=$(echo "$lts" | awk -F'/' 'END{ print (/^rtt/? ""$5"":"FAIL") }' )
disp=$(echo "$lts" | awk -F'/' 'END{ print (/^rtt/? "OK "$5" ms":"FAIL") }' )

if (( $(echo "$png > $max_lts" | bc -l) ));  then
  mpv https://www.youtube.com/watch?v=dQw4w9WgXcQ
  exit;
fi;

echo $disp;

done;