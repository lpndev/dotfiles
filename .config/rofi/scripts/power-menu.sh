#!/bin/bash

case "$1" in
  "") echo -e "Shutdown\nReboot\nSuspend\nLock\nLogout" ;;
  "Shutdown") systemctl poweroff ;;
  "Reboot") systemctl reboot ;;
  "Suspend") systemctl suspend ;;
  "Lock") swaylock ;;
  "Logout") swaymsg exit ;;
esac
