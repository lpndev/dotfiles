typeset -U path PATH
path=(~/.local/bin ~/AppImages $path)
export PATH
export ZDOTDIR="$HOME/.config/zsh"

set -a
source "$HOME/.config/environment.d/envvars.conf"
set +a
