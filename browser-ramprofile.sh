#!/bin/bash

ramdir="$XDG_RUNTIME_DIR/ramstore"
compression_method="bz2"

userhome="$HOME"
datastore="$userhome/shared/store"

declare -a browsers=("firefox" "chromium") 

set_browser() {
	browser_prefix="$1"
	ramprofile="${ramdir}/$browser_prefix"
	case "$browser_prefix" in 
	"chromium")
        browser_config_path="$userhome/.config/${browser_prefix}"
		browser_cache_path="${userhome}/.cache/${browser_prefix}"
		browser_config_store="${datastore}/${browser_prefix}_config.cpio.${compression_method}"
		browser_cache_store="${datastore}/${browser_prefix}_cache.cpio.${compression_method}"
        ;; 
	"firefox")
        browser_config_path="$userhome/.mozilla"
		browser_cache_path="${userhome}/.cache/mozilla"
		browser_config_store="${datastore}/${browser_prefix}_config.cpio.${compression_method}"
		browser_cache_store="${datastore}/${browser_prefix}_cache.cpio.${compression_method}"
        ;; 
    *)
        echo "Unsupported browser."
        ;; 
esac
}

setup_ramstore() {
mkdir -p "$ramdir"
mkdir "$ramdir/$browser_prefix"

sudo mount -t tmpfs tmpfs "$ramprofile"
mkdir "$ramprofile/"{config,cache}

# Remove the protective symlinks on system.
if [ -L "$browser_config_path" ]; then 
	rm "$browser_config_path" "$browser_cache_path"
fi;

mkdir "${browser_config_path}"
mkdir "${browser_cache_path}"

sudo mount -o bind "$ramprofile/config" "$browser_config_path"
sudo mount -o bind "$ramprofile/cache"  "$browser_cache_path"
}

load_profile() {
	cd "$ramprofile"
	lbzip2 -dc < "$browser_config_store" | cpio -idm
	lbzip2 -dc < "$browser_cache_store" | cpio -idm
}


sync_profile() {
	cd "$ramprofile"
	# Cleanup unnecessary cache
	rm -rf "$ramprofile/cache/Default/Cache"
	rm -rf "$ramprofile/config/Default/Application Cache"

	find "./config" | cpio -o -B -H newc  | lbzip2 -zc > "${browser_config_store}.Unconfrimed"
	let "retVal=$?"

	if ((  retVal > 1 ))  ; then
    		echo "Error while compressing data."
			exit -1 
	fi

	find "./cache" | cpio -o -B -H newc | lbzip2 -zc > "${browser_cache_store}.Unconfrimed" 
	let "retVal=$?"

	if ((  retVal > 1 ))  ; then
    		echo "Error while compressing data."
			exit -1 
	fi

		rm  "${browser_config_store}"
		rm  "${browser_cache_store}"
	    mv  "${browser_config_store}.Unconfrimed"  "${browser_config_store}"
		mv  "${browser_cache_store}.Unconfrimed"  "${browser_cache_store}"
	
}

# Default action is setup.
if [ "$1" = "load" ]; then
	for b in "${browsers[@]}"; do
		set_browser "$b"
		setup_ramstore "$b"
   		load_profile "$b"
	done
elif [ "$1" = "profile" ]; then
	load_profile	
elif [ "$1" = "sync" ]; then
	for b in "${browsers[@]}"; do
		set_browser "$b"
   		sync_profile
	done
	
fi
