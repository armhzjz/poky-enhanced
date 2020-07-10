#!/bin/bash

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
