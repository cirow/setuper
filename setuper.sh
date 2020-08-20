#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
PARENT_PATH="$(dirname "$(readlink -f "$0")")"


checkSudo() {
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
}

case "$1" in
    dbeaver) 
        checkSudo;
        "${PARENT_PATH}/functions/dbeaver/install.sh"
    ;;
    postman) 
        checkSudo;
        "${PARENT_PATH}/functions/postman/install.sh"
    ;;
    vscodium) 
        checkSudo;
        "${PARENT_PATH}/functions/vscodium/install.sh"
    ;;
    chrome) 
        checkSudo;
        "${PARENT_PATH}/functions/chrome/install.sh"
    ;;
    minikube) 
        checkSudo;
        "${PARENT_PATH}/functions/minikube/install.sh"
    ;;
    help)
        cat "${PARENT_PATH}/functions/help"
    ;;
    remove) echo "Remove function will be added: ${2}"
    ;;
    *) echo "Argument ${1} not recognized, try setuper help for instructions"
    ;;
esac

