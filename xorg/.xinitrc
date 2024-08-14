#!/bin/sh
#
# ~/.xinitrc

setxkbmap -option "ctrl:swapcaps"
xcape
xset m 7 10
# xset r rate 250 25
xset r rate 200 30
setxkbmap dwarf

# add right ctrl to Mod3 to be used in i3 config to make a wacom pen button map to
# right ctrl without affecting left ctrl
xmodmap -e 'remove Control = Control_R'
xmodmap -e 'add Mod3 = Control_R'

# feh --no-fehbg --bg-scale "/home/gregoire/.config/wallpapers/wpp$[$RANDOM % 5 + 1].jpg"
feh --no-fehbg --bg-scale "/home/gregoire/.config/wallpapers/test.png"
redshift -O 2500
#picom & (it is launched in the i3 config file, don't know where it should be...)
exec i3
#exec instantwm
