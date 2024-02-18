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
alias addp="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias rmp="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"

setopt HIST_SAVE_NO_DUPS

function change-dir-fzf() {
    dir=$(fd -c "always" --type d . $HOME | fzf --ansi --height 40%)
    if [ ! -z "$dir" ]
    then
        cd $dir
    fi

    zle reset-prompt
}

function open-file-fzf() {
    file=$(fd -c "always" --type f . $HOME | fzf --ansi --height 40%)
    if [ ! -z "$file" ]
    then
        $EDITOR $file
    fi

    zle reset-prompt
}

zle -N change-dir-fzf
zle -N open-file-fzf

bindkey '^g' change-dir-fzf
bindkey '^o' open-file-fzf

PROMPT='%F{red}%~ %B%F{blue}>%f%b '

# use z
eval "$(zoxide init --cmd cd zsh)"
