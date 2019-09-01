#! /usr/bin/env bash

killall compton
killall polybar
pkill -f python2\ /usr/bin/statnot
killall unclutter
i3-msg reload
exec compton --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf &
exec statnot ~/repos/perfect-arch-config/notifications/statnot_conf.py &
exec unclutter &

for m in $(~/repos/perfect-arch-config/list_active_displays.sh); do
    MONITOR=$m polybar --reload example &
done
