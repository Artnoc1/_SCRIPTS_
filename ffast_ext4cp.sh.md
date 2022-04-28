#!/bin/bash

devfile="$1"
uaction="$2"


setup_mount() {
	tune2fs -o journal_data_writeback "$devfile"
	tune2fs -O ^has_journal  "$devfile"

	mkdir /run/ext4
	mount -o barrier=0,nojournal_checksum,   "$devfile" /run/ext4
}

remount_revert() {
	umount /run/ext4 
	tune2fs -O has_journal  "$devfile"
	e2fsck "$devfile"
	
}


if [ "$uaction" = "mount" ] ; then
	setup_mount
fi
if [ "$uaction" = "revert" ] ; then
	remount_revert
fi;
