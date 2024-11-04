#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install libpq-dev \
  python3-dev \
  python3-venv \
  build-essential \
  libpcre3-dev \
  curl \
  nano \
  ca-certificates \
  nmap \
  flameshot \
  psensor -y  
sudo apt clean -y

sudo apt install flatpak gnome-software-plugin-flatpak  -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.calibre_ebook.calibre
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.sublimetext.three
flatpak install flathub io.beekeeperstudio.Studio
flatpak install flathub net.ankiweb.Anki
flatpak install flathub org.kde.kolourpaint
flatpak install flathub rest.insomnia.Insomnia
flatpak install flathub org.telegram.desktop

flatpak override --env=GTK_THEME=Adwaita:dark com.calibre_ebook.calibre
flatpak override --env=GTK_THEME=Adwaita:dark com.discordapp.Discord
flatpak override --env=GTK_THEME=Adwaita:dark com.sublimetext.three
flatpak override --env=GTK_THEME=Adwaita:dark io.beekeeperstudio.Studio
flatpak override --env=GTK_THEME=Adwaita:dark net.ankiweb.Anki
flatpak override --env=GTK_THEME=Adwaita:dark org.kde.kolourpaint
flatpak override --env=GTK_THEME=Adwaita:dark rest.insomnia.Insomnia
flatpak override --env=GTK_THEME=Adwaita:dark org.telegram.desktop

snap install spotify
sudo snap install code --classic

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm install --lts

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin -y
sudo apt update -y
sudo apt install docker-compose-plugin
sudo usermod -aG docker $USER
newgrp docker

dconf load /org/gnome/settings-daemon/plugins/media-keys/ < ./configs/keybindings/custom-keybindings.txt
