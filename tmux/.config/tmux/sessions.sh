#!/bin/sh
#
# ./dotfiles/tmux/.config/tmux/sessions.sh

selected_session=$(ls -d ~/dev/*/ | xargs -n 1 basename | fzf-tmux -p)
dir_path="${HOME}/dev/${selected_session}"

if [ "$selected_session" == "" ]; then
    exit
fi

if [ "$(tmux ls | grep $selected_session)" == "" ]; then
    # Create the session
    tmux new-session -d -A -s "$selected_session" -c "$dir_path"

    # Detect session type
    if [ -f "${dir_path}/Cargo.toml" ]; then
        # Rust session
        tmux rename-window "Code"
        tmux send-keys "nvim src" Enter
        tmux new-window -c "#{pane_current_path}" -n "Build"
        tmux select-window -t "$selected_session":Code
    fi
fi

tmux switch-client -t "$selected_session"
