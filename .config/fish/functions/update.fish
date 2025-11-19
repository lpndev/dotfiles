function update
  set -l stamp ~/.last_update

  if test -f $stamp
    set -l last (math (date +%s) - (date -r $stamp +%s))
    if test $last -lt 604800
      echo "already updated in the last 7 days"
      read -l -P "update anyway? [y/n] " confirm
      if test "$confirm" != "y"
        echo "update cancelled"
        return
      end
    end
  end

  yay -Syu
  flatpak update
  touch $stamp
end
