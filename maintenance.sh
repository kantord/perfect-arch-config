#!/usr/bin/env bash

# Free up space by deleting old journals
sudo journalctl --vacuum-time=4weeks
