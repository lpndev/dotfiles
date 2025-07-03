export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(bun fzf git nvm starship zoxide zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd zsh-navigation-tools)
source $ZSH/oh-my-zsh.sh

alias cd="z"
alias fetch="fastfetch"
alias ll="ls -ahl"
alias ls="eza --icons"
alias rm="rm -rfv"
alias scan-files="ncdu / --exclude /mnt/"
alias scan-links="sudo rmlint /home"
alias sudo="sudo "
alias update-clean="yay -Syu --noconfirm && yay -Scc --noconfirm && paccache -r && rm ~/.cache/* && sudo pacman -Rns $(pacman -Qtdq) --noconfirm"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"