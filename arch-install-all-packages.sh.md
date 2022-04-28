#!/bin/bash


# archboot is fucked
while IFS='' read -r line || [[ -n "$line" ]]; do
    package-query -S --qconflicts "$line"
done < <(pacman -Slq core extra community | grep -v archboot)

