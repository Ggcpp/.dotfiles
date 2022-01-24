#!/bin/sh
#
# ~/.xinitrc

setxkbmap -option "ctrl:swapcaps"
xset m 7 10
xset r rate 250 25
feh --no-fehbg --bg-scale "/home/gregoire/.config/wallpapers/gruvbox-wallpaper.png"
#picom -f &
exec i3
