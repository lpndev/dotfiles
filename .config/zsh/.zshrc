# paths
export ZSH="$HOME/.config/zsh/ohmyzsh"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# environment
ZSH_CACHE_DIR="$HOME/.cache/ohmyzsh"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
ZSH_CONFIG="$HOME/.config/zsh"
ZSH_CUSTOM="$ZSH/custom"
ZSH_THEME=""

# completitions
fpath=($ZSH_CUSTOM/plugins/zsh-completions/src $fpath)

# real time completitions
source $ZSH_CUSTOM/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

zstyle -e ':autocomplete:*:*' list-lines 'reply=( 1000 )'
zstyle ':autocomplete:history:*' list-lines 1000

# plugins
plugins=(starship zoxide fzf direnv zsh-completions zsh-autocomplete zsh-syntax-highlighting)

# source other configs
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# custom settings
source $ZSH_CONFIG/aliases.zsh
source $ZSH_CONFIG/functions.zsh

# welcome message
fastfetch
