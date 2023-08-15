#!/usr/bin/env zsh

# Initial stuff
# =============

# Where config files are found
export ZDOTDIR=$HOME/.config/zsh

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
export AWS_VAULT_PROMPT=ykman
