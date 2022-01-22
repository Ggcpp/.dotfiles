#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#xset r rate 250 25
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

neofetch
