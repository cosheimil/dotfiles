#!/bin/sh
kbdd &
xrandr --output DP-1 --mode 1920x1080 --rate 120.00 &
picom -b &