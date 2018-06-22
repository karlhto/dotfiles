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

ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
mkdir build && cd "$_"
git clone git@github.com:neovim/neovim.git && \
    cd neovim && make && make install && cd ..
cd ..

mkdir -p $HOME/.local/share/nvim/ && cp configs/local/* "$_"
mkdir -p $HOME/.config/nvim/ && cp configs/config/* "$_"
