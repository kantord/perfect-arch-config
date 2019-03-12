#! /usr/bin/bash 
echo "stowing $1"
stow -t ~ -d ~/repos/perfect-arch-config/dotfiles $1
