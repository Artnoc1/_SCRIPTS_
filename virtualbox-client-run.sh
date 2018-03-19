#!/bin/bash

if lsmod | grep vboxguest ; then
/usr/bin/VBoxClient-all
fi