# custom keyboard layout
echo "Setting custom keyboard layout"
sudo cp ~/repos/perfect-arch-config/keyboard/custom /usr/share/X11/xkb/symbols/
setxkbmap custom intl-unicode -option caps:escape

# dotfiles
./setup_dotfiles.sh


# Set up bluetooth
systemctl enable bluetooth.service
systemctl start bluetooth.service

# Set up images for lockscreen
betterlockscreen -u /usr/share/backgrounds/f30/extras/
