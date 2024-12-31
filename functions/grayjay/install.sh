#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';

TMP_DIR="/home/${SUDO_USER}/.cache/setuper/grayjay"
[ -f "${TMP_DIR}" ] && rm "${TMP_DIR}"
[ -d "${TMP_DIR}" ] || mkdir "${TMP_DIR}"
rm -rf "${TMP_DIR}"/*

SOURCE_LINK="https://updater.grayjay.app/Apps/Grayjay.Desktop/Grayjay.Desktop-linux-x64.zip"

wget -O "${TMP_DIR}/grayjay.zip" "${SOURCE_LINK}"
cd ${TMP_DIR} && sudo unzip grayjay.zip -d /usr/local/grayjay
readonly bin_dir="$(find /usr/local/grayjay -mindepth 1 -maxdepth 1 -type d)"
echo "bin_dir=${bin_dir}"
ls "${bin_dir}/" | grep ^Grayjay$ || exit 1

sudo chown -R "${SUDO_USER}":"${SUDO_USER}" "/usr/local/grayjay"
APP_PATH="${bin_dir}" envsubst > "/home/${SUDO_USER}/.local/share/applications/grayjay.desktop" < "${PARENT_PATH}/functions/grayjay/grayjay.desktop"
sudo chown "${SUDO_USER}":"${SUDO_USER}" "/home/${SUDO_USER}/.local/share/applications/grayjay.desktop"

