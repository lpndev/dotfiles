function clean
  yay -Scc --noconfirm
  paccache -r
  sudo bleachbit --clean deepscan.tmp journald.clean system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs

  set orphans (pacman -Qtdq)
  if test -n "$orphans"
    sudo pacman -Rns --noconfirm $orphans
  end
end
