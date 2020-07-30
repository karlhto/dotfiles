#!/usr/bin/env bash

# A wrapper script for i3lock-color to customise look and feel

i3lock \
	--screen 1 \
	--blur 6 \
	--clock \
	--datestr="%a, %-d. %b %Y" \
	--pass-media-keys
