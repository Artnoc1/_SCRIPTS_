#!/bin/bash
# usage: fstabalign [FILE]

# This script will output fstab or other file as column aligned.
# It will not alter blank lines or #hash comments.

if [ -z "$1" ]; then
    FILE=$(cat /etc/fstab)
else
    FILE=$(cat "$1")
fi

# Separate the file contents into aligned and unaligned parts.
OUT_ALIGNED=$(echo "$FILE" | sed 's/^\s*#.*//' | nl -ba | column -t)
OUT_UNALIGNED=$(echo "$FILE" | sed 's/^\s*[^#].*//' $src | nl -ba)

# Remerge aligned and unaligned parts.
while read; do
    line_aligned="$REPLY"
    read -u 3; line_unaligned="$REPLY"
    line_aligned=$(  echo "$line_aligned"   | sed 's/\s*[0-9]*\s*//')
    line_unaligned=$(echo "$line_unaligned" | sed 's/\s*[0-9]*\s*//')
    echo "$line_aligned$line_unaligned"
done < <(echo "$OUT_ALIGNED") 3< <(echo "$OUT_UNALIGNED")