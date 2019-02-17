

for sc in ${script_dir}/*.sh ; do
if test -x $sc ; then

second_line="$( sed -n -e '2{s/ //g;p;q}' < "$sc" )"

 if $(echo "$second_line" | grep -q -E '^# *@install' ) ; then
    sc_install="$(echo "$second_line" |  awk -F ':' '{print $2}'  )"
if [ ! -z "$sc_install" ]; then
#ln -s "$sc" "${bin_dir}/${sc_install}"
fi
fi
fi
done

