#! bash

echo "Creating dummy config files"
# This is required because some applications don't install config files so wpgtk won't work otherwise
mkdir -p dotfiles/rofi/.config/rofi
touch dotfiles/rofi/.config/rofi/config

mkdir -p dotfiles/polybar/.config/polybar
touch dotfiles/polybar/.config/polybar/config

mkdir -p dotfiles/i3/.config/i3
touch dotfiles/i3/.config/i3/config

echo "Creating vim undo directory"
mkdir -p ~/.vim/undodir

echo "Installing packages"
yay -Syu --needed --noconfirm - < ./packages.txt

echo "Creating screenshot directory"
mkdir -p ~/pics/screenshots/

echo "Setting custom keyboard layout"
./custom_keyboard.sh

# dotfiles
./setup_dotfiles.sh


# Set up bluetooth
systemctl enable bluetooth.service
systemctl start bluetooth.service

# Set up images for lockscreen
betterlockscreen -u /usr/share/backgrounds/f30/extras/

sudo npm install -g prettier-eslint-cli

# Needed for deoplete
pip2 install --user --no-binary :all: pynvim
pip install --user --no-binary :all: pynvim

# Auto connect to available network
systemctl enable netctl-auto@

# Install GTK theme
wpg-install.sh -g
wpg-install.sh -i

# Load dconf
./load_dconf.sh

# Setup crontabs
crontab ./crontab
systemctl enable cronie.service
systemctl start cronie.service


# Setup vim
./vim_setup.sh

# Install devicons for ranger
rm -rf ~/.config/ranger/plugins/ranger_devicons && git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# Install go dependencies
go get -u github.com/termhn/i3-vim-nav
