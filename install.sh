#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

if [[ "$1" = "--help" || "$1" = "-h" ]]; then
    echo "Build the poky-enhanced image and install \"poky_startContnr\" under"
    echo "/usr/local/bin."
    echo "If \"--no-install\" is passed as argument, only the image will be built"
    echo "without any script installation on the aforementioned directory."
    exit 0
fi

# first build  the container if it does not exist already
if  [[ -z $( docker images | grep poky-enhanced ) ]]; then
    . "${SCRIPT_DIR}/build_dockerImage.sh"
else
    echo "Container already exists. Proceeding to install it."
fi

if [ ! "$1" = "--no-install" ]; then
    cp ${SCRIPT_DIR}/files/poky_startContnr ${HOME}/bin/
    chmod +x ${HOME}/bin/poky_startContnr
    echo "Installation succeded."
    echo "'poky_startContnr' can be called from within your top project's path."
else
    echo "Docker image built. No installation of starting script was done."
fi
