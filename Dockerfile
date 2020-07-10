#!/bin/bash
ARG     CROPS_POKY_TAG
FROM    crops/poky:${CROPS_POKY_TAG}

# swtich to root user to install additional packages
USER    root

RUN     set -x && \
        apt-get update && \
        apt-get install -y \
            vim \
            mc \
            && \
        rm -fr /var/lib/apt/lists/* && \
        :

# swtich back to regular user
USER    usersetup
