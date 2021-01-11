ARG     CROPS_POKY_TAG
FROM    crops/poky:${CROPS_POKY_TAG}
MAINTAINER armhzjz

# swtich to root user to install additional packages
USER    root

RUN     set -x && \
        apt-get update && \
        apt-get install -y \
            vim \
            mc \
            libncurses5-dev \
            libncursesw5-dev \
            python3 \
            python3-pip \
            && \
        rm -fr /var/lib/apt/lists/* && \
        :

# install kas
RUN     set -x && \
        pip3 install kas && \
        :

# switch back to regular user
USER    usersetup

