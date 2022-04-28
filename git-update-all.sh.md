#!/bin/bash

# git pull all repos in a directory, defaults to current dir


REPOS=($(find . -name .git -type d -prune -printf '%h\n'))

CDIR=$PWD

for r in ${REPOS[@]}
do
cd $r
printf "Updating; $r \n"
git pull 
cd $CDIR
done

exit
