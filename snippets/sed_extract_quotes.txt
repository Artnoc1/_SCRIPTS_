From unix stackexchange (https://unix.stackexchange.com)
  https://unix.stackexchange.com/questions/137030/how-do-i-extract-the-content-of-quoted-strings-from-the-output-of-a-command
  https://unix.stackexchange.com/a/137031

sed:

  sed -e 's/.*\"\(.*\)\".*/\1/
s

s    sed -e 's/.*\"\(.*\)\".*/\1/'

grep with pcre: 
  grep -oP '(?<=").*(?=")' )"

