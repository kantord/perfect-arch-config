#! /usr/bin/env bash

killall compton
killall polybar
killall twmnd
i3-msg reload
exec compton --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf &
exec twmnd &

for m in $(./list_active_displays.sh); do
    MONITOR=$m polybar --reload example &
done
