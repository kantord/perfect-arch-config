#! /usr/bin/env bash


wallpaper_file=$(cat /home/kdani/repos/perfect-arch-config/dotfiles/wpgtk/.config/wpg/wp_init.sh | grep wpg | cut -f3 -d' ' | sed "s/'//g")


echo "setting lockscreen to $wallpaper_file" > /tmp/lockscreen_log.txt
betterlockscreen -u /home/kdani/repos/perfect-arch-config/dotfiles/wpgtk/.config/wpg/wallpapers/$wallpaper_file &
