#! /usr/bin/env bash

sleep $1

for m in $(~/repos/perfect-arch-config/list_active_displays.sh); do
    MONITOR=$m polybar --reload example &
done


