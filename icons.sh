#!/bin/bash

# Installing IOS icons from Cutefish in Ubuntu :)

echo $'Installing CMake \n'
sudo apt install cmake -y

echo $'\nDownload the Icons '
git clone https://github.com/cutefishos/icons.git

cd icons
mkdir build && cd build
cmake ..
make
sudo make install

echo $'\n Enter Gnome-Tweaks and change the icons to the name "Crule" xD'