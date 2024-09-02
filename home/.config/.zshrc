# OH-MY-ZSH CONFIGURATION
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

# ZSH PLUGINS
plugins=(bun eza fzf git nvm pip pipenv python starship zoxide zsh-autosuggestions zsh-interactive-cd zsh-navigation-tools zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ALIASES
alias sudo="sudo "
alias ls="eza --icons"
alias ll="ls -ahl"
alias fetch="fastfetch"
alias cd="z"
alias rm="rm -rfv"

# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac