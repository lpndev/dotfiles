ZSH_CACHE="$HOME/.cache"

# completions
autoload -Uz compinit
compinit -d "$ZSH_CACHE/zcompdump"
zstyle ':completion:*' menu select

# history
HISTFILE="$ZSH_CACHE/history"
HISTSIZE=10000
SAVEHIST=10000

# tools
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# aliases
alias sudo='sudo '
alias cd='z'
alias ls='eza --color=always --group-directories-first --icons'
alias la='ls -a'
alias ll='la -hl'
alias lt='la -T --git-ignore'

# vars
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
export LIBVIRT_DEFAULT_URI=qemu:///system

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# welcome
[[ $SHLVL -le 2 ]] && fastfetch

# functions
clean() {
  sudo pacman -Scc
  sudo pacman -Rns $(sudo pacman -Qtdq)
  echo "system cleanup complete"
}

update() {
  sudo pacman -Syu
  flatpak update -y
  mise update -y
  echo "system update complete"
}
