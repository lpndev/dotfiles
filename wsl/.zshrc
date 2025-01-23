export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(bun fzf git nvm starship zoxide zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd zsh-navigation-tools)
source $ZSH/oh-my-zsh.sh

alias cd="z"
alias fetch="fastfetch"
alias ll="ls -ahl"
alias ls="eza --icons"
alias rm="rm -rfv"
alias sudo="sudo "

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"