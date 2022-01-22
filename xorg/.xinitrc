#!/bin/sh
#
# ~/.xinitrc

setxkbmap -option "ctrl:swapcaps"
xset r rate 250 25
feh --no-fehbg --bg-scale '/home/gregoire/.config/feh/wallpaper1.webp'
#picom -f &
exec i3
