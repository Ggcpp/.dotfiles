#!/bin/sh
#
# .dotfiles/install.sh

# Establish an internet connection
systemctl start NetworkManager
systemctl enable NetworkManager

# Install basic needs for desktop environment
pacman -S xorg-server xorg-xinit
pacman -S i3-wm i3status dmenu
pacman -S alacritty
pacman -S chromium
pacman -S alsa-utils

# Vanity stuff
pacman -S neofetch
pacman -S feh
pacman -S picom

# Make symlinks dynamically
pacman -S stow

for folder in */
do
	stow $folder
done
