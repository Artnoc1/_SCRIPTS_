#!/usr/bin/env sh

#check for files which dont belong to user..

files=($(find . ! -user cswl));

fixfunc() {
chmod 0600 ${@}
chown "$(id -u)".users ${@}
}

fixfunc $files
