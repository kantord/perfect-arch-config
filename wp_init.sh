#! /usr/bin/env bash

command_to_run=$(cat ~/repos/perfect-arch-config/dotfiles/wpgtk/.config/wpg/wp_init.sh | grep wpg | sed "s/rsL/s/")
echo $command_to_run
eval $command_to_run &&
exec ./set_lockscreen.sh
