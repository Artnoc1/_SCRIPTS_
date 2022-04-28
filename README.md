# scripts  

Shell scripts and other stuff.  

Use `scm` to install (symlink) scripts to your "$PATH" 
`scm` hasn't been written yet.  

A rough sketch of how it supposed to works.  
A comment below the shebang line like this.  
```
#!/bin/bash
# export=short_name group=group_name
```

Any script can be symlinked to `~/bin` or another directory in `$PATH` by simply running `scm` with `~/.local/scm.conf`

```
[scripts]
short_name
short_name as shnm

[groups]
group_name
```

## android  
Scripts used only on android. 

## external  
External scripts, downloaded from the internet.

