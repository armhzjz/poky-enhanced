#!/bin/bash

set -e

if [[ "$1" = "--help" || "$1" = "-h" ]]; then
    echo "Build the poky-enhanced image and install \"poky_startContnr\" under"
    echo "/usr/local/bin."
    echo "If \"--no-install\" is passed as argument, only the image will be built"
    echo "without any script installation on the aforementioned directory."
    exit 0
fi

# first build  the container if it does not exist already
if  [[ -z $( docker images | grep poky-enhanced ) ]]; then
    ./build_dockerImage.sh
else
    echo "Container already exists. Proceeding to install it."
fi

if [ ! "$1" = "--no-install" ]; then
    cp ./files/poky_startContnr /usr/local/bin
    chmod +x poky_startContnr
    echo "Installation succeded."
    echo "'poky_startContnr' can be called from within your top project's path."
else
    echo "Docker image built. No installation of starting script was done."
fi
