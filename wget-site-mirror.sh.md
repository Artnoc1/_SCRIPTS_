#!/usr/bin/sh  
#script.export wgm


# mirrors a webpage

set -x

cmd_args=$1
sit_url=$2

cwd=$PWD

opts=$(cat "${cwd}/.wgmconf")

start_mirror() {
wget -m  -p -np -nd  -c --html-extension --convert-links  ${opts}  ${sit_url}
}

upd_mirror() {
exec "wget --mirror -p -np -N -c --html-extension --convert-links  ${opts} ${sit_url}"
}

start_mirror
