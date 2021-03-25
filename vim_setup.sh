#! /usr/bin/env bash

echo "Installing vim plugins"
nvim -E -c PlugInstall -c qa

echo "Updating vim plugins"
nvim -E -c PlugUpdate -c qa

echo "Done with vim setup"

sudo npm install -g tsun write-good markdown-lint
