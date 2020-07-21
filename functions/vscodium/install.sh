#!/bin/bash
WARN='\033[1;33m';
SUCCESS='\033[0;32m'
NORMAL='\033[0m';

# Check if the user is sudoing
if [ "${SUDO_USER}" == '' ]; then
    echo -e "${WARN}Setuper probably needs sudo acesss to install files, you may experience issues running as a regular user.${NORMAL}";
    read -p "Do you know what you are doing? (Y or y for yes) " -n 1 -r;
    echo;
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Stopping execution."
        exit 1
    fi
fi

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 
sudo apt update -y && sudo apt install codium
echo -e "${SUCCESS}VS Codium installed successfuly${NORMAL}";