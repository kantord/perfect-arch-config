#! /usr/bin/env bash

killall compton
killall polybar
i3-msg reload
exec compton --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf &

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
done
