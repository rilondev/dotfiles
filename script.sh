#!/bin/bash

#Script to configure Ubuntu and newly installed derivatives in system :)

echo $'updating the system, plz wait... \!/ \n'
sudo apt update && sudo apt upgrade -y 

echo $'\n Installing other Tools'
sudo apt install \
    ubuntu-restricted-extras \
    gnome-tweaks \
    dconf-editor \
    curl \
    apt-transport-https \
    git \
    neofetch \
    -y

echo $'\n adding Brave and Spotify repositories'
#Spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" > sudo tee /etc/apt/sources.list.d/spotify.list

#Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" > sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo $'Added Repositories | \n'
echo $'Updating Repositories'
sudo apt update 

echo $'\nInstalling Apps'

sudo apt install \
    spotify \
    brave-browser \
    vlc \
    gufw \
    synaptic \
    -y 


echo $'\nD0ne and GoodBye xD'



