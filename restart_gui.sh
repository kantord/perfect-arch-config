#! /usr/bin/env bash

killall compton
killall polybar
i3-msg reload
exec compton --config ~/repos/perfect-arch-config/dotfiles/compton/.config/compton/compton.conf &
exec polybar -r example &
