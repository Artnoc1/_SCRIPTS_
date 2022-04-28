
//add # to begining of file
# sed -e '/.*/s/^/        /g'

# sed -e '/BBB/s/^/#/g' -i file

Remove line numbers from a file
cat <file> | sed 's/^ *[0-9]\+//g'