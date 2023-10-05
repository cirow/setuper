#!/bin/bash
readonly PARENT_PATH="/home/${SUDO_USER}/.cache/setuper"
readonly _local_file="${PARENT_PATH}/nvim-linux64.tar.gz"
readonly _release_url="https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"

wget -O "${_local_file}" "${_release_url}"
tar -zxvf "${_local_file}" -C "${PARENT_PATH}"

function copydirs(){
    src="${1}"
    dest="${2}"

    echo "${src}* -> ${dest}"
    cp -r "${src}"/* "${dest}"
}


copydirs "${PARENT_PATH}/nvim-linux64/share" "/home/${SUDO_USER}/.local/share"
copydirs "${PARENT_PATH}/nvim-linux64/man"  "/home/${SUDO_USER}/.local/share/man"
copydirs "${PARENT_PATH}/nvim-linux64/lib"  "/home/${SUDO_USER}/.local/lib"
copydirs "${PARENT_PATH}/nvim-linux64/bin"  "/home/${SUDO_USER}/.local/bin"

rm -f "${_local_file}" && echo -e "${_local_file} successfuly removed"

su "${SUDO_USER}" -c 'nvim --version'