#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias v=nvim
alias i3edit="v $HOME/.config/i3/config"
alias vgl="valgrind --leak-check=full --show-leak-kinds=all"


unsetopt share_history

mcd () {
    mkdir $1
    cd $1
}

grp () {
    # For extra option exclude dir
    EXTRA=""
    if [ ! -z "$2" ]; then
        EXTRA="--exclude-dir=$2"
    fi

    grep -I -R $EXTRA -n -w -e $1 .
}

add_to_path() {
    export PATH=$PATH:$1
}

# Powerlevel10k
source $HOME/.purepower

add_to_path $HOME/.local/bin
add_to_path $HOME/.cargo/bin
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export TERM=xterm-256color
