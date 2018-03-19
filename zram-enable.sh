#!/bin/bash

# config
CONFIG_ZRAM_SIZE=192M

# for initial loading module and disk
init() {
modprobe zram
zramctl -s "$CONFIG_ZRAM_SIZE" zram0
mkswap /dev/zram0
swapon /dev/zram0
}

# zram doesn't clear itself so need to reload
reload() {
swapoff /dev/zram0
zramctl -r zram0
zramctl -s "$CONFIG_ZRAM_SIZE" zram0
mkswap /dev/zram0
swapon /dev/zram0
}


opt=$1

$opt
