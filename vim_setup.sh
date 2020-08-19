#! /usr/bin/env bash

echo "Installing vim plugins"
vim -E -c PlugInstall -c qa

echo "Updating vim plugins"
vim -E -c PlugUpdate -c qa

echo "Done with vim setup"
