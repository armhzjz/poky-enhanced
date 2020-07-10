#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

POKY_CONTAINER_TAG=ubuntu-18.04

CROPS_POKY_TAG=ubuntu-18.04

DOCKER_BUILD_ARGS=" --build-arg CROPS_POKY_TAG=$CROPS_POKY_TAG \
                    "

docker build --rm \
        $DOCKER_BUILD_ARGS \
        --network=host \
        -t poky-enhanced:$POKY_CONTAINER_TAG \
        $SCRIPT_DIR
