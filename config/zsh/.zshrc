# Initialisation
# ==============
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Options
# =======
unsetopt share_history
setopt histignorespace


# Aliases
# =======
alias tmux='tmux -2'
alias v=nvim
alias i3edit="v $HOME/.config/i3/config"


# Style
# =====
source ${ZDOTDIR}/.purepower # configuration of powerlevel10k
