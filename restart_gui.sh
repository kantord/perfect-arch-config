#! /usr/bin/env bash

killall compton
killall polybar
i3-msg reload
exec compton --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf &

for m in $(xrandr | grep connected | grep -v disconn | sed 's/ .*//'); do
    MONITOR=$m polybar --reload example &
done
