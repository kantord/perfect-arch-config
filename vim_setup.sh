#! /usr/bin/env bash

echo "Installing vim plugins"
vim -E -c PlugInstall -c qa

echo "Updating vim plugins"
vim -E -c PlugUpdate -c qa

echo "Done with vim setup"


# Share config between vim and neovim
echo "set runtimepath+=~/.vim,~/.vim/after" > ~/.config/nvim/init.vim
echo "set packpath+=~/.vim" >> ~/.config/nvim/init.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

sudo npm install -g tsun
