#!/bin/sh

aria2c `echo "$@" | sed 's/github/raw.githubusercontent/' | sed 's|blob/||' | sed 's|tree/||'    `
