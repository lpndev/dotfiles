function fish_greeting; fastfetch; end

source ~/.config/fish/aliases.fish

set --export STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source
fzf --fish | source
zoxide init fish | source
~/.local/bin/mise activate fish | source
