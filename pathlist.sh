#!/usr/bin/env sh

# Lists paths in env var $PATH

printf ${PATH} | awk -F ':' '{for(i=1;i<=NF;++i) print $i }'