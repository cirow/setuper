#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
PARENT_PATH="$(dirname "$(readlink -f "$0")")"

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


wget -O "${PARENT_PATH}/haroopad.deb" https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.13.1-x64.deb;
dpkg -i "${PARENT_PATH}/haroopad.deb";
apt-get install -f;
rm -f "${PARENT_PATH}/haroopad.deb";
