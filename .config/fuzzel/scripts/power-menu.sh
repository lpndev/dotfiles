reply=$(echo -e " Shutdown\n Reboot\n󰌾 Lock\n󰍃 Logout" | fuzzel --dmenu --prompt='Power Menu: ')

case $reply in
  *Shutdown) systemctl poweroff ;;
  *Reboot) systemctl reboot ;;
  *Lock) swaylock ;;
  *Logout) swaymsg exit ;;
esac
