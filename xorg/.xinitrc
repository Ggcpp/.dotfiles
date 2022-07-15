#!/bin/sh
#
# ~/.xinitrc

setxkbmap -option "ctrl:swapcaps"
xcape
xset m 7 10
xset r rate 250 25
setxkbmap dwarf
feh --no-fehbg --bg-scale "/home/gregoire/.config/wallpapers/abyss.png"
picom &
exec i3
