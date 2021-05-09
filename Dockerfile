ARG     CROPS_POKY_TAG
FROM    crops/poky:${CROPS_POKY_TAG}
MAINTAINER armhzjz

# swtich to root user to install additional packages
USER    root

# update gcc version to 9
RUN	set -x && \
	apt update && \
	apt install software-properties-common -y && \
	apt update && \
	add-apt-repository ppa:ubuntu-toolchain-r/ppa && \
	apt update && \
	apt install g++-9 -y && \
	add-apt-repository --remove ppa:ubuntu-toolchain-r/ppa -y && \
	apt remove software-properties-common -y && \
	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 60 && \
	update-alternatives --config g++ && \
	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 && \
	update-alternatives --config g++ && \
	:

# add additional packages
RUN     set -x && \
        apt update && \
        apt install -y \
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

