#!/bin/bash
WARN='\033[1;33m'
NORMAL='\033[0m'
PARENT_PATH="$(dirname "$(readlink -f "$0")")"

checkSudo() {
    # Check if the user is sudoing
    if [ "${SUDO_USER}" == '' ]; then
        echo -e "${WARN}Setuper probably needs sudo acesss to install files, you may experience issues running as a regular user.${NORMAL}"
        read -p "Do you know what you are doing? (Y or y for yes) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Stopping execution."
            exit 1
        fi
    fi

    if [ ! -d "/home/${SUDO_USER}/.cache/setuper/" ]; then
        mkdir "/home/${SUDO_USER}/.cache/setuper/"
        chown -R "${SUDO_USER}:${SUDO_USER}" "/home/${SUDO_USER}/.cache/setuper/"
        echo "Creating Setuper cache directory"
    fi
}

case "$1" in
help)
    cat "${PARENT_PATH}/functions/help"
    ;;
remove)
    echo "Remove function will be added: ${2}"
    ;;
*)
    checkSudo
    [[ -d "${PARENT_PATH}/functions/${1}" ]] || (echo -e "${WARN}${1} not found${NORMAL}" && exit 1)
    "${PARENT_PATH}/functions/${1}/install.sh"
    ;;
esac
