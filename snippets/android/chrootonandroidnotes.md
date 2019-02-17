
** Create /dev/fd 
 ln -s /proc/self/fd /dev/fd

** Generete locale
Debian:
 > sudo apt-get install locales
 > locale-gen "en_US.UTF-8"
 > dpkg-reconfigure locales
Arch:
 Uncomment locale in /etc/locale.gen
 > locale-gen
 export LANG=en_US.UTF in ~/profile
 
** setting up timezone
tzselect doesn't work
nor adding /etc/timezone
however this works
 > ln -s /usr/share/zoneinfo/continent/country /etc/localtime

** Archlinux su e
[root@localhost ~]# su - user
su: warning: cannot change directory to /home/user: Permission denied
su: /bin/bash: Permission denied
 > chmod 0755 /

** No devpts 
in HOST system, 
 > mount devpts /dev/pts -t devpts

** Double prompt:
getting user@localhost:[user@localhost]
delete screen) case in /etc/bash.bashrc
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
