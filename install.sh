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

# Install yay to download AUR packages
pushd ~
git clone "https://aur.archlinux.org/yay.git"
cd yay
makepkg -si
rm -rf yay
popd

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
