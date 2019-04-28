#! /usr/bin/env bash

xrandr | grep connected | grep -v disconnected | grep "[0-9]\+x" | sed "s/ .*//"
