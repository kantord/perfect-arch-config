#! /usr/bin/env bash

echo "Installing vim plugins"
vim -E -c PlugInstall -c qa

echo "Updating vim plugins"
vim -E -c PlugUpdate -c qa

echo "Installing coc plugins"
vim -E -c "CocInstall coc-sources" -c qa
vim -E -c "CocInstall coc-tsserver" -c qa
vim -E -c "CocInstall coc-json" -c qa
vim -E -c "CocInstall coc-flow" -c qa
vim -E -c "CocInstall coc-yaml" -c qa
vim -E -c "CocInstall coc-python" -c qa
vim -E -c "CocInstall coc-marketplace" -c qa

echo "Done with vim setup"
