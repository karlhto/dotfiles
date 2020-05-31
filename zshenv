#!/usr/bin/env zsh

# Initial stuff
# =============

# Where config files are found
export ZDOTDIR=$HOME/.config/zsh

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


# Exports
# =======

# Add ~/.local/bin to path
export PATH=$HOME/.local/bin:$PATH

# Use fd for more speedy FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .clangd --exclude .git'

# Extract default GPG key ID, might be useful
export KEYID=$(gpgconf --list-options gpg | awk -F: '$1 == "default-key" {print substr($10,2)}')


# Aliases
# =======
alias tmux='tmux -2'
alias v=nvim
alias i3edit="v $HOME/.config/i3/config"


# Functions
# =========
mcd () {
    mkdir $1
    cd $1
}
