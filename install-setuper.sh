#!/bin/bash
SUCCESS='\033[0;32m'
NORMAL='\033[0m';


PARENT_PATH="/home/${SUDO_USER}";
#download and extract
wget -O "${PARENT_PATH}/setuper.zip"  https://github.com/cirow/setuper/archive/master.zip
unzip "${PARENT_PATH}/setuper.zip" -d "${PARENT_PATH}/"
if [ -d  "${PARENT_PATH}/setuper" ]; then
    sudo mv "${PARENT_PATH}/setuper" "${PARENT_PATH}/setuper_";
fi
sudo chown -R "${SUDO_USER}":"${SUDO_USER}" "${PARENT_PATH}/setuper-master" && sudo mv "${PARENT_PATH}/setuper-master" "${PARENT_PATH}/setuper"
ln -sfn "${PARENT_PATH}/setuper/setuper.sh" /usr/local/bin/setuper;
if [ $? -eq 0 ]; then
    sudo rm -rf "${PARENT_PATH}/setuper_"
    echo -e "${SUCCESS}Setuper installed, type 'sudo setuper help' to learn how to use it${NORMAL}"
fi