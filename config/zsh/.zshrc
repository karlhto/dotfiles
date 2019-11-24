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

# Powerlevel10k
source ${ZDOTDIR}/.purepower

alias tmux='tmux -2'
