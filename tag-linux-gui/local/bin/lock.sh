#!/usr/bin/env bash

# A wrapper script for i3lock-color to customise look and feel

set -e
xset s off dpms 0 10 0

i3lock \
	--screen 1 \
	--blur 6 \
	--clock \
	--datestr="%a, %-d. %b %Y" \
	--pass-media-keys \
	--ignore-empty-password \
	--show-failed-attempts \
	--nofork

xset s off -dpms
