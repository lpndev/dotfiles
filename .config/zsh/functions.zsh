clean() {
  echo "Cleaning package cache..."
  sudo pacman -Scc

  echo "Removing orphaned packages..."
  sudo pacman -Rns $(sudo pacman -Qtdq)

  echo "Cleaning journal logs older than 1 week..."
  sudo journalctl --vacuum-time=1week

  echo "Deleting user cache files..."
  rm -rf ~/.cache/*

  echo "Deleting temporary files..."
  sudo rm -rf /tmp/*

  echo "System cleanup complete!"
}

update() {
  echo "Updating mirrors..."
  mirrors || {
    echo "Mirror update failed";
  }

  echo "Checking system clock..."
  if ! timedatectl show -p NTPSynchronized --value | grep -q yes; then
    echo "Syncing clock..."
    sudo timedatectl set-ntp true
    sleep 3
  fi

  echo "Updating keyring..."
  if ! sudo pacman -Sy --needed archlinux-keyring; then
    echo "Resetting pacman keys..."
    sudo rm -rf /etc/pacman.d/gnupg
    sudo pacman-key --init
    sudo pacman-key --populate archlinux
    sudo pacman -Sy --needed archlinux-keyring
  fi

  echo "Full system upgrade..."
  sudo pacman -Su

  echo "Updating AUR..."
  yay -Sua

  echo "Updating Flatpaks..."
  flatpak update -y

  echo "System updated successfully."
}

reinstall-yay() {
  echo "Removing yay..."
  sudo pacman -Rns yay yay-bin yay-debug yay-bin-debug

  echo "Cloning and reinstalling yay from source..."
  cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ~

  echo "Yay reinstallation complete!"
}
