#!/bin/bash

# search for all .git repos in all subdirectories
# cd into them
# and run the git command

command="$1"

if [[ "$command" = "scan" ]] ; then
	find . -name .git -type d -prune -exec dirname {} \; | tee .scancache.git-allsubdirs
fi;

# show only changed files
if [[ "$command" = "status" ]] ; then
root=$(pwd)
while read -r dir; do
  cd "$root/$dir" || exit;
  git diff --exit-code &> /dev/null
  if (( "$?" != 0 ));
  then
    printf '\e[1;34m%-6s\e[m'  "$dir \\n"
    git status
    printf "\\n"
   fi
done < .scancache.git-allsubdirs
fi;

# run custom git command
if [[ "$command" = "git" ]] ; then
root=$(pwd)
while read -r dir; do
  cd "$root/$dir" || exit;
    printf '\e[1;34m%-6s\e[m'  "$dir \\n"
    git "${@:2}"
    printf "\\n"
done < .scancache.git-allsubdirs
fi;

# find . -name .git -type d -prune | while IFS= read -r dir_git; do
#     dir=$(dirname $dir_git)
#     echo $dir
# done