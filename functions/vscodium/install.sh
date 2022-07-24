#!/bin/bash
WARN='\033[1;33m';
SUCCESS='\033[0;32m'
NORMAL='\033[0m';

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list
apt update && apt install codium

echo -e "${SUCCESS}VS Codium installed successfuly${NORMAL}";