#!/bin/bash

# Verificando se foi instalado ou não
install_app() {
    app_name=$1
    sudo apt install -y $app_name > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$app_name foi instalado com sucesso"
    else
        echo "Não foi possível instalar $app_name"
    fi
}

add_repository() {
    repository_key_url=$1
    repository_url=$2
    sudo curl -fsSLo /usr/share/keyrings/repository-archive-keyring.gpg $repository_key_url
    echo "deb [signed-by=/usr/share/keyrings/repository-archive-keyring.gpg arch=amd64] $repository_url" | sudo tee /etc/apt/sources.list.d/repository-release.list > /dev/null
}

echo "Atualizando o sistema, por favor, aguarde..."
sudo apt update && sudo apt upgrade -y > /dev/null

echo "Instalando outras ferramentas..."
sudo apt install -y \
    ubuntu-restricted-extras \
    gnome-tweaks \
    dconf-editor \
    curl \
    apt-transport-https \
    git \
    neofetch

echo "Adicionando repositórios e instalando aplicativos..."
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A8580BDC82D3DC6C
add_repository "https://brave-browser-apt-release.s3.brave.com/brave-core.asc" "https://brave-browser-apt-release.s3.brave.com/ stable main"
echo "\n"s
sudo apt update > /dev/null
echo "\n"
echo "Instalando aplicativos..."
install_app "brave-browser"
install_app "vlc"
install_app "gufw"
install_app "synaptic"
echo "\n"
echo "\n"
echo "Resumo da instalação:"
if dpkg -l | grep -qw "brave-browser"; then
    echo "Brave Browser foi instalado"
else
    echo "Brave Browser não foi instalado"
fi

if dpkg -l | grep -qw "vlc"; then
    echo "VLC foi instalado"
else
    echo "VLC não foi instalado"
fi

if dpkg -l | grep -qw "gufw"; then
    echo "Gufw foi instalado"
else
    echo "Gufw não foi instalado"
fi

if dpkg -l | grep -qw "synaptic"; then
    echo "Synaptic foi instalado"
else
    echo "Synaptic não foi instalado"
fi

