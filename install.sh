#!/usr/bin/env zsh

#if ! [ $(id -u) = 0 ]; then
    #echo "Must be run as root"
    #exit 1
#fi

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

cat .zshrc > $HOME/.zshrc

if [ -x "$(command -v nvim)" ]; then
    # neovim
    mkdir -p $HOME/.config/nvim/
    cp -Rf config/nvim/* $HOME/.config/nvim/
fi

if [ -f $HOME/.zpreztorc ]; then
    cat .zpreztorc > $HOME/.zpreztorc
    cp -f .purepower $HOME/.purepower
fi
