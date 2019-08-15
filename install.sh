#!/usr/bin/env sh -v

if ! [ $(id -u) = 0 ]; then
    echo "Must be run as root"
    exit 1
fi

unameOut="$(uname -s)"
case "${unameOut}" in # to be used
    Linux*)
        machine=Linux;;
    Darwin*)
        machine=Mac;;
    *)
        echo $"System version not supported, configs can not be installed"
        exit 1
esac


mkdir -p $HOME/.local/share/nvim/ && cp configs/local/* "$_"
mkdir -p $HOME/.config/nvim/ && cp configs/config/* "$_"
