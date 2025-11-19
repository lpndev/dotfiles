# greeting
function fish_greeting; fastfetch; end

# aliases
source ~/.config/fish/aliases.fish

# starship
set --export STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source

# tools
fzf --fish | source
zoxide init fish | source
~/.local/bin/mise activate fish | source

# composer
set -U fish_user_paths $fish_user_paths ~/.config/composer/vendor/bin
