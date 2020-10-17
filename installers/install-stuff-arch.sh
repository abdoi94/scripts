#!/bin/bash

#Sublime-text
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg

echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

sudo pacman -Syu ; sudo pacman -Syu sublime-text thermald lm_sensors psensor figlet-mode fortune

#install-stuff
yay -Syu flatpak papirus-icon-theme vlc meld gparted telegram-desktop chromium htop neofetch plata-theme numix-circle-arc-icons-git numix-circle-icon-theme-git numix-cursor-theme-git ccache-git mate-terminal ttf-opensans rofi
