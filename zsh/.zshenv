export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="chromium"

export FZF_DEFAULT_OPTS='--bind=ctrl-e:up,ctrl-y:down,ctrl-i:accept'

# Fixing paths
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export CONDA_ROOT="$XDG_CONFIG_HOME/conda"
