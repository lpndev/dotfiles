alias cat='bat --paging=always --color=always'
alias cd='z'

alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -alh --color=always --group-directories-first --icons --git --time-style=long-iso'
alias ls='eza --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons'

alias reload='source ~/.config/fish/config.fish'
alias snapshot='sudo snapper create --description "snapshot-$(date +%Y%m%d)"'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
