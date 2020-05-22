#! /usr/bin/env bash

killall -q compton
killall -q polybar
pkill -f python2\ /usr/bin/statnot
killall -q unclutter

# wait until polybar is killed
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.3; done

i3-msg reload
if [ "$1" == "grayscale" ]; then
   exec compton --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf --glx-fshader-win "$(cat ~/repos/perfect-arch-config/grayscale.glsl)" &
   hsetroot
else
   exec compton --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf &
fi
exec statnot ~/repos/perfect-arch-config/notifications/statnot_conf.py &
exec unclutter &

exec ~/repos/perfect-arch-config/start_polybar.sh 0 &
