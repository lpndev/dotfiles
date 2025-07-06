if test -z "$DISPLAY"; and test "$XDG_VTNR" = "1"
    exec Hyprland
end

set fish_greeting

if test -f ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end

if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q fzf
    fzf --fish | source
end
