
     rsync -avn  -e 'ssh -p 2222  -i /usr/home/.ssh/id.rsa' --port 2222 root@192.168.0.101:/usr/ /tmp/

# notice the trailing slash
# it copies contents of directory

# if you want the directory itself set new one in
rsync -avn  -e 'ssh -p 2222  -i /usr/home/.ssh/id.rsa' --port 2222 root@192.168.0.101:/usr/ /tmp/usr
# DONOT LOSE THE SLASH in host
# if host dir is a symlink.. it will create dir to

