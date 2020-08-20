#!/bin/bash
WARN='\033[1;33m';
SUCCESS='\033[0;32m'
NORMAL='\033[0m';

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 
sudo apt update -y && sudo apt install codium
echo -e "${SUCCESS}VS Codium installed successfuly${NORMAL}";