#!/usr/bin/bash

# Prevent duplicates if script runs multiple times
pgrep -x picom > /dev/null || picom --config ~/.config/picom/picom.conf -b &
# Add more if you want:
# pgrep -x nm-applet || nm-applet &
# pgrep -x dunst || dunst &
pgrep -x nitrgen || nitrogen --restore &   
