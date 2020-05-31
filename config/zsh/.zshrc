# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt share_history
setopt histignorespace

# Powerlevel10k
source ${ZDOTDIR}/.purepower
