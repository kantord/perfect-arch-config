#! bash

echo "Setting custom keyboard layout"
./custom_keyboard.sh

# dotfiles
./setup_dotfiles.sh


# Set up bluetooth
systemctl enable bluetooth.service
systemctl start bluetooth.service

# Set up images for lockscreen
betterlockscreen -u /usr/share/backgrounds/f30/extras/
