

debugfs /dev/loop0

Verify that data is inlined.

# Create random files.

seq -w 1 10 | xargs -n1 -I% sh -c 'dd if=/dev/urandom of=file.% bs=$(shuf -i1-10 -n1) count=1024'

