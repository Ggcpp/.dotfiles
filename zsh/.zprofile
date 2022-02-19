#
# ~/.zprofile
# executed one time on login bash shell

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi
