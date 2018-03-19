#!/usr/bin/bash

# Generates all sshd host keys

dest=$HOME/.ssh
KEY_TYPES=('rsa' 'dsa' 'ecdsa' 'ed25519' )

for key in ${KEY_TYPES[@]}; do
ssh-keygen -t $key -f "${dest}/ssh_host_${key}_key"
done;

exit;

