#!/usr/bin/env zsh
# Cool
export ZDOTDIR=$HOME/.config/zsh

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Speedy FZF needs rg
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden"'

#export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
#export TERM=xterm-256color
