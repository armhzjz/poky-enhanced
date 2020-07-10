#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

docker run -it --rm --network=host -v $SCRIPT_DIR:/workdir -v /home/eindemwort/yocto:/home/eindemwort/yocto --workdir=/workdir poky-enhanced:ubuntu-18.04
