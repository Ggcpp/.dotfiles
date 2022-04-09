#
# $ZDOTDIR/.zshrc
#

bindkey -v
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gregoire/.config/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='ls --color'
alias fr='setxkbmap -layout ch -variant fr'
alias us='setxkbmap us'
alias vim='nvim'

setopt HIST_SAVE_NO_DUPS

PROMPT='%F{red}%~ %B%F{blue}>%f%b '

neofetch
