#!/usr/bin/env bash

# Kill on error
set -e

tag="tag-$(uname -s)"

gui=1
remote_pat="(.*/)?sshd"
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || \
   [[ $(ps -o comm= -p $PPID) =~ $remote_pat ]]; then
	gui=0
fi

if [ ! -z $gui ] && [ -d $tag-gui ] ; then
	rcup -t $tag -t $tag-gui
else
	rcup -t $tag
fi
