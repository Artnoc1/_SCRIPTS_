#!/bin/bash 

# exec chromium with no cache
exec chromium --disk-cache-dir=/dev/null --media-cache-dir=/dev/null
