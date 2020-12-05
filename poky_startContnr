#!/bin/bash

#SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

docker run -it --rm --network=host -v $PWD:/workdir -v ${YOCTO_DL_SSTATE}:${YOCTO_DL_SSTATE} --workdir=/workdir poky-enhanced:ubuntu-18.04
