# Initialisation
# ==============
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Exports
# =======

# Add ~/.local/bin to path
export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/texlive/2020/bin/x86_64-linux:$PATH

export MANPATH=/opt/texlive/2020/texmf-dist/doc/man:$MANPATH
export INFOPATH=/opt/texlive/2020/texmf-dist/doc/info:$INFOPATH

# Use fd for more speedy FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .clangd --exclude .git'

# Extract default GPG key ID, might be useful
export KEYID=$(gpgconf --list-options gpg | awk -F: '$1 == "default-key" {print substr($10,2)}')


# Functions
# =========
mcd () {
    mkdir $1
    cd $1
}

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
