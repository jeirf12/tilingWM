#!/bin/sh

# systray battery icon
# cbatticon -u 5 &
# systray volume
# volumeicon &
# monitors
# xrandr --addmode HDMI-1 1366x768
# xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --output HDMI-1 --mode 1366x768 --pos 0x768
# xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x768 --output HDMI-1 --mode 1366x768 --pos 0x0 &
picom --experimental-backends &
