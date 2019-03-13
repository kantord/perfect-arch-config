#! /usr/bin/env bash

sudo cp ~/repos/perfect-arch-config/keyboard/custom /usr/share/X11/xkb/symbols/
setxkbmap custom intl-unicode -option caps:escape


