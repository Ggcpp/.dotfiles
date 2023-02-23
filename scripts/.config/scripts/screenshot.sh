#!/bin/sh
#
# .dotfiles/scripts/screenshot.sh

[ ! -d ~/Screenshots ] && mkdir ~/Screenshots

output=~/Screenshots/screenshot.png

scrot "$output" --select -e 'xclip -selection clipboard -t image/png -i $f'
