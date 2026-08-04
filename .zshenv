typeset -U path PATH
path=(
  "$HOME/.local/bin"
  "$HOME/AppImages"
  $path
)
export PATH
