#!/bin/bash

if [[ "$1" = "--help" || "$1" = "-h" ]]; then
    echo "Build the poky-enhanced image and install startCropsPokyCont.sh under"
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
    cp startCropsPokyCont.sh /usr/local/bin
    chmod +x startCropsPokyCont.sh
    echo "Installation succeded."
else
    echo "Docker image built. No installation of starting script was done."
fi
