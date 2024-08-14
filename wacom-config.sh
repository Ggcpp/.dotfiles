#!/bin/sh

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

# To configure
# pixels per inch
ppi=93
display_width_px=2560
display_height_px=1440

list=$(xsetwacom list devices)
pad=$(echo "${list}" | awk '/pad/{print $7}')
stylus=$(echo "${list}" | xsetwacom list devices | awk '/stylus/{print $7}')

if [ -z "${pad}" ]; then
    exit 0
fi

cm_per_inch=2.54

let display_demi_width_px=display_width_px/2
let display_demi_height_px=display_height_px/2

tablet_width_cm=$(xsetwacom get $stylus Area | cut -d ' ' -f 3)
tablet_height_cm=$(xsetwacom get $stylus Area | cut -d ' ' -f 4)

tablet_width_px=$(bc -l <<< 'scale=5 ppi/cm_per_inch*tablet_width_cm')
tablet_height_px=ppi/cm_per_inch*tablet_height_cm

tablet_width_px=printf "%.*f\n" "0" "$tablet_width_px"
tablet_height_px=printf "%.*f\n" "0" "$tablet_height_px"

xsetwacom set ${stylus} MapToOutput "${tablet_width_pixel}x${tablet_height_px}+${display_demi_width_px}+${display_demi_height_px}"
xsetwacom set ${stylus} Area 0 0 ${tablet_width_cm} $(${tablet_width_cm}*${display_height_px}/${display_width_px})
