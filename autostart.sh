#!/bin/sh

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &
# monitors
xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x768 --output HDMI-1 --mode 1366x768 --pos 0x0 &
