#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
PARENT_PATH="/home/${SUDO_USER}/.cache/setuper/dbeaver"

wget -O "${PARENT_PATH}/dbeaver-ce_latest_amd64.deb" https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb;
dpkg -i "${PARENT_PATH}/dbeaver-ce_latest_amd64.deb";
apt-get install -f;
rm -f "${PARENT_PATH}/dbeaver-ce_latest_amd64.deb";
