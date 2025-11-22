clean() {
  echo "Cleaning package cache..."
  sudo pacman -Scc --noconfirm

  echo "Removing orphaned packages..."
  sudo pacman -Rns $(sudo pacman -Qtdq) --noconfirm

  echo "Cleaning journal logs older than 2 weeks..."
  sudo journalctl --vacuum-time=2weeks

  echo "Deleting user cache files..."
  rm -rf ~/.cache/*

  echo "Deleting temporary files..."
  sudo rm -rf /tmp/*

  echo "System cleanup complete!"
}

update() {
  echo "Updating packages..."
  sudo pacman -Syu --noconfirm

  echo "Updating AUR packages..."
  yay -Syu --noconfirm

  echo "Updating Flatpak packages..."
  flatpak update -y

  echo "System update complete!"
}
