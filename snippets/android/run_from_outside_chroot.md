#!/system/bin/sh

export ROOT=/cache/lroot
export LD_LIBRARY_PATH=$ROOT/usr/lib
cd $ROOT
./lib/ld-linux-*.so* ./usr/bin/env $1