#! /usr/bin/env bash

killall -q compton
killall -q polybar
pkill -f python2\ /usr/bin/statnot
killall -q unclutter

# wait until polybar is killed
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.3; done

i3-msg reload
if [ "$1" == "grayscale" ]; then
   MODE=grayscale exec ~/repos/perfect-arch-config/compton-grayscale-reading-mode/compton.sh --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf &
   hsetroot
else
   MODE=normal exec ~/repos/perfect-arch-config/compton-grayscale-reading-mode/compton.sh --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf &
fi
exec statnot ~/repos/perfect-arch-config/notifications/statnot_conf.py &
exec unclutter &

exec ~/repos/perfect-arch-config/start_polybar.sh 0 &

# Update spotify looks
spicetify update
