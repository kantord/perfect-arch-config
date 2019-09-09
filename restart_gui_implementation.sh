#! /usr/bin/env bash

killall -q compton
killall -q polybar
pkill -f python2\ /usr/bin/statnot
killall -q unclutter

# wait until polybar is killed
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.3; done

i3-msg reload
exec compton --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf &
exec statnot ~/repos/perfect-arch-config/notifications/statnot_conf.py &
exec unclutter &

exec ./start_polybar.sh 0 &
