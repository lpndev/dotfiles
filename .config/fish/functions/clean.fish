function clean
  yay -Scc --noconfirm
  paccache -r

  set orphans (pacman -Qtdq)
  if test -n "$orphans"
    sudo pacman -Rns --noconfirm $orphans
  end
end
