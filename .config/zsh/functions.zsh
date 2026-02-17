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
  mirrors

  echo "Updating pacman packages..."
  sudo pacman -Syyu

  echo "Updating AUR packages..."
  yay -Sua

  echo "Updating Flatpak packages..."
  flatpak update -y

  echo "System update complete!"
}

reinstall-yay() {
  echo "Removing yay..."
  sudo pacman -Rns yay yay-bin yay-debug yay-bin-debug

  echo "Cloning and reinstalling yay from source..."
  cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ~

  echo "Yay reinstallation complete!"
}
