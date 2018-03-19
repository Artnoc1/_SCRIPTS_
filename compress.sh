#!/bin/sh

	btrfs filesystem defragment -r -v -czstd "$1"