#!/bin/bash
PARENT_PATH="/home/${SUDO_USER}/Setuper";
#download and extract
ln -sfn "${PARENT_PATH}/setuper.sh" /usr/local/bin/setuper;
if [ $? -eq 0 ]; then
    echo "Setuper installed, type 'sudo setuper help' to learn how to use it"
fi