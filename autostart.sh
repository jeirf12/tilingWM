#!/bin/bash

if xrandr | grep "HDMI-1 disconnected"; then
  xrandr --addmode HDMI-1 1366x768
  xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --output HDMI-1 --mode 1366x768 --pos 0x768
fi
# systray battery icon
# cbatticon -u 5 &
# systray volume
# volumeicon &
# monitors
# xrandr --addmode HDMI-1 1366x768
# xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --output HDMI-1 --mode 1366x768 --pos 0x768
# xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x768 --output HDMI-1 --mode 1366x768 --pos 0x0 &
# picom --experimental-backends &
nm-applet &
udiskie -t &
volumeicon &
cbatticon &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
feh --bg-scale ~/Backgrounds/sasuke-2.png &
blueman-applet &
firejail --rlimit-as=300000000 picom &
