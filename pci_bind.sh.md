#!/bin/bash

usr="$SUDO_USER"

if [[ -z "$usr" ]]; then
	printf "This script must be run via sudo"
	exit 1;
fi;

echo "8086 191b" > /sys/bus/pci/drivers/pci-stub/new_id
echo "0000:02:00.0" > /sys/bus/pci/devices/0000:02:00.0/driver/unbind
echo "0000:02:00.0" > /sys/bus/pci/drivers/pci-stub/bind