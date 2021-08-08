# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy


mod = "mod4"

#Default configuration
#keys = [Key(key[0], key[1], *key[2:]) for key in [

#modified configuration
keys = [Key(*key[0:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
    ([mod], "r", lazy.spawncmd()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "f", lazy.spawn("firefox")),
    ([mod], "b", lazy.spawn("brave")),

    # File Explorer
    ([mod], "e", lazy.spawn("caja")),

    # Terminal
    ([mod], "Return", lazy.spawn("gnome-terminal")),

    # Redshift
    ([mod], "r", lazy.spawn("redshift -O 2400")),
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    ([mod], "s", lazy.spawn("flameshot")),

    #Zoom
    ([mod], "z", lazy.spawn("zoom")),

    # ------------ Hardware Configs ------------

    # Volume
    ([],"XF86AudioLowerVolume", lazy.spawn("pamixer -d 5")),
    ([],"XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")),
    ([],"XF86AudioMute", lazy.spawn("pamixer -t")),

    # Brightness
    ([],"XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([],"XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),

    #-------------Keys pause--------------
    ([],"XF86AudioPlay", lazy.spawn("playerctl play-pause")),
]]
