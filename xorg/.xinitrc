#!/bin/sh
#
# ~/.xinitrc

setxkbmap -option "ctrl:swapcaps"
xcape
xset m 7 10
xset r rate 250 25
setxkbmap dwarf
feh --no-fehbg --bg-scale "/home/gregoire/.config/wallpapers/main.jpg"
redshift -O 2500
picom &
exec i3
