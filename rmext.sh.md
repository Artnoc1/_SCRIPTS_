#!/usr/bin/env sh

# rmext : remove files with specific extension
# useful to remove eg *.log files


case "$2" in
rf)  find . -name "*.$1" -exec rm {} +
;;
* )  find . -name "*.$1" 
;;
esac