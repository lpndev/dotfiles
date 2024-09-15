# OH-MY-ZSH CONFIGURATION
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

# ZSH PLUGINS
plugins=(bun fzf git nvm starship zoxide zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd zsh-navigation-tools)
source $ZSH/oh-my-zsh.sh

# ALIASES
alias cd="z"
alias fetch="fastfetch"
alias ll="ls -ahl"
alias ls="exa --icons"
alias rm="rm -rfv"
alias sudo="sudo "

# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
