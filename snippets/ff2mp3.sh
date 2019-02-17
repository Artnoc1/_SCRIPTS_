#!/bin/bash

ffmpeg -i "$1" -codec:a libmp3lame -qscale:a 1 output2.mp3