#!/bin/sh
#
# .dotfiles/install.sh

# Establish an internet connection
ps -C NetworkManager >/dev/null || (systemctl start NetworkManager && systemctl enable NetworkManager)

# Functions
install_pacman_packages() {
    pacman -S $(<pkglist/.pkglist/pacman)
    pacman -Syu
}

# To download AUR packages
install_yay() {
    pushd ~

    git clone "https://aur.archlinux.org/yay.git"
    pushd yay
    makepkg -si
    popd
    rm -rf yay

    popd
}

install_aur_packages() {
    yay -S $(<pkglist/.pkglist/aur)
    yay
}

# Get options
while getopts Apayh flag
do
    case "${flag}" in
        A)
            install_pacman_packages
            install_yay
            install_aur_packages
            break;;
        p)
            install_pacman_packages;;
        a)
            install_aur_packages;;
        y)
            install_yay;;
        h)
            echo "A: install yay + pacman and AUR packages."
            echo "p: install pacman packages."
            echo "a: install AUR packages."
            echo "y: install yay."
            echo "h: print help."
            break;;
    esac
done

# Make symlinks dynamically
for folder in */
do
	stow $folder
done
