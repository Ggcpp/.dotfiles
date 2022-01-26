#!/bin/sh
#
# ~/start.sh

JSON_FILE=$(i3-msg -t get_workspaces)

# Open workspace
i3 workspace number "$1"

NB_WS=$(jq '. | length' <<< $JSON_FILE)
TARGET_WS="$1"

WS_EXIST=false
for ((i=0; i<$NB_WS; i++));
do
    CUR_WS=$(jq .[$i].num <<< $JSON_FILE)
    if [[ "$CUR_WS" == "$TARGET_WS" ]]
    then
        WS_EXIST=true
        break
    fi
done

if [[ "$WS_EXIST" == false ]]
then
    case $TARGET_WS in
        9)
            alacritty -e nvim;;
        10)
            chromium;;
    esac
fi
