# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh configurations
ZSH_THEME="robbyrussell"
echo $ZSH_THEME

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim='nvim'
alias tree='exa --tree --level=2 --icons -a'

# Created by `pipx` on 2023-12-23 19:47:46
export PATH="$PATH:/Users/ericclaflin/.local/bin"
