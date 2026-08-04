# shell config
ZSH_CACHE="$HOME/.cache/zsh"
HISTFILE="$ZSH_CACHE/history"
HISTSIZE=10000
SAVEHIST=10000
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
mkdir -p "$ZSH_CACHE"

# completions
autoload -Uz compinit
compinit -d "$ZSH_CACHE/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'

# tools
eval "$(zoxide init zsh --cmd cd)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(mise activate zsh)"

# aliases
alias sudo='sudo '
alias ls='eza --color=auto --group-directories-first --icons'
alias la='ls -a'
alias ll='la -hl'
alias lt='la -T --git-ignore'

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# welcome
[[ $SHLVL -le 2 ]] && fastfetch

# functions
clean() {
  sudo pacman -Scc
  sudo pacman -Rns $(sudo pacman -Qtdq)
  sudo rm -rf /tmp/*
  echo "system cleanup complete"
}

update() {
  sudo pacman -Syu
  flatpak update -y
  mise upgrade -y
  echo "system update complete"
}
