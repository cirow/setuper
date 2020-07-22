#!/bin/bash
PARENT_PATH="/home/${SUDO_USER}";
#download and extract
wget -O ${PARENT_PATH}/setuper.zip  https://github.com/cirow/setuper/archive/master.zip
unzip ${PARENT_PATH}/setuper.zip -d ${PARENT_PATH}/
sudo chown ${SUDO_USER}:${SUDO_USER} ${PARENT_PATH}/setuper-master && sudo mv ${PARENT_PATH}/setuper-master ${PARENT_PATH}/setuper
ln -sfn "${PARENT_PATH}/setuper/setuper.sh" /usr/local/bin/setuper;
if [ $? -eq 0 ]; then
    echo "Setuper installed, type 'sudo setuper help' to learn how to use it"
fi