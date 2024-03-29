#
# ~/.bashrc
# executed on new interactive bash shell

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

alias fr='setxkbmap -layout ch -variant fr'
alias us='setxkbmap us'
alias vim='nvim'

neofetch
