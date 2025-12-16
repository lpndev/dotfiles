export ZSH="$HOME/.config/zsh/ohmyzsh"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

ZSH_CACHE_DIR="$HOME/.cache/ohmyzsh"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
ZSH_CONFIG="$HOME/.config/zsh"
ZSH_CUSTOM="$ZSH/custom"
ZSH_THEME=""

fpath=($ZSH_CUSTOM/plugins/zsh-completions/src $fpath)

plugins=(starship zoxide fzf mise composer zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH_CONFIG/aliases.zsh
source $ZSH_CONFIG/functions.zsh

fastfetch

# bun completions
[ -s "/home/reki/.bun/_bun" ] && source "/home/reki/.bun/_bun"
