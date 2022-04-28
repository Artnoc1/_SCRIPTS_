From: 
https://github.com/vkohaupt/vokoscreen/issues/171#issuecomment-324943191


/etc/X11/xorg.conf.d/20-graphics.conf:

Section "Device"
	Identifier	"Intel Graphics"
	Driver		"modesetting"
	Option		"AccelMethod"    "glamor"
EndSection
