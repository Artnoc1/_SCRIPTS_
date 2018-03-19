#!/bin/bash

exec /usr/bin/git clone --depth 1 "${@:2}"
