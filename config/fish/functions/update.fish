function update
    set -l stamp ~/.last_update

    # Check if update was run in the last 7 days
    if test -f $stamp
        set -l last (math (date +%s) - (date -r $stamp +%s))
        if test $last -lt 604800
            echo "You already updated in the last 7 days."
            read -l -P "Proceed anyway? [y/N] " confirm
            if test "$confirm" != "y"
                echo "Update cancelled."
                return
            end
        end
    end

    # Confirmation prompt
    read -l -P "Are you sure you want to update? [y/N] " confirm
    if test "$confirm" = "y"
        yay -Syu --noconfirm
        touch $stamp
    else
        echo "Update cancelled."
    end
end