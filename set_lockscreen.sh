#! /usr/bin/env bash

wallpaper_file=$(cat ~/repos/perfect-arch-config/dotfiles/wpgtk/.config/wpg/wp_init.sh | grep wpg | sed "s/wpg -rsL '//;s/'.*$//")

betterlockscreen -u ~/repos/perfect-arch-config/dotfiles/wpgtk/.config/wpg/wallpapers/$wallpaper_file &
