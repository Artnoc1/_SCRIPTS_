

## parisng value when there are multiple options on the string

Example parsing root= on /proc/cmdline

# Cswl Coldwind (cswl1337@gmail.com)
# This work is licensed under a Creative Commons Attribution 4.0 International License 
# http://creativecommons.org/licenses/by/4.0/

$(awk '{ for (i=1;i<=NF;++i) { if( match($i,/root/) == 1 ) print $i}} ' /proc/cmdline | \
   awk -F '=' '{ print $2 } '

Note that this doesn't handle cases when there are "=" in the value itself.
For that you can use.
    awk -F '=' '{for (i=2; i<=NF; i++) print $i}'

However that will also split into more '='. so you need a recursive solution
Or you can just define a function and call it again.

How to root=UUID=XXXX-XXXX


awk_getval() {
  sep="$1"
  prop="$2"
  awk '{ for (i=1;i<=NF;++i) { if( match($i,/root/) == 1 ) print $i}} ' /proc/cmdline | \
   awk -F '=' '{for (i=2; i<=NF; i++) printf $i"="}'  
}