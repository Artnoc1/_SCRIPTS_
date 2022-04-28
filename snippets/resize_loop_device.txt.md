From AskUbuntu (https://askubuntu.com)
  https://askubuntu.com/questions/260620/resize-dev-loop0-and-increase-space
https://askubuntu.com/a/260679

You can use sudo losetup /dev/loop0 to see what file the loopback device is attached to, then you can increase its size with, for example

`sudo dd if=/dev/zero bs=1MiB of=/path/to/file conv=notrunc oflag=append count=xxx` 

where xxx is the number of MiB you want to add. 
After that,

`sudo losetup -c /dev/loop0` 
`sudo resize2fs /dev/loop0` 

should make the new space available for use.