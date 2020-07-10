# poky-enhanced

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Authors](#authors)

## About <a name = "about"></a>

Boils down to a poky container with vim and mc included on it. This container is based on `crops/poky:ubuntu-18.04`. Check [Dockerhub](https://hub.docker.com/r/crops/poky/tags) and the [poky-container repository on Github](https://github.com/crops/poky-container).<br>
If you wished to build the container based on other distro or a different ubuntu version, modify the script `build_dockerImage.sh` accordingly.

## Getting Started <a name = "getting_started"></a>


To build the container simple:
```
bash build_dockerImage.sh*
```
That will build a container called `poky-enhanced:ubuntu18-04`.

### Prerequisites

As prerequiste you only need to install [Docker](https://www.docker.com/) locally.
The start script uses environment variables I have in my system. These env vars are:
 * `YOCTO_DL_SSTATE` - parent directory of the location where (during a build ) all source code tarballs are downloaded to as well as of the location where yocto will find and/or create the "shared state" files.

 Normally these locations should be specified also in your yocto project's local.conf file - otherwise they will not be of use (but that is a yocto related topic you can check [here](https://www.yoctoproject.org/docs/3.1.1/mega-manual/mega-manual.html#var-DL_DIR) and [here](https://www.yoctoproject.org/docs/3.1.1/mega-manual/mega-manual.html#var-SSTATE_DIR)).

 So, if you don't want to export these varaibles, or you want to name them differently you will need to remove them (or rename them) from the starting script (i.e. `startCropsPokyCont.sh`).

### Installing

If you run the script `install.sh` as sudo, you will install the starting script (i.e. `startCropsPokyCont.sh`) under /usr/local/bin, so you can run the container under any of your projects directories.<br>
The installation is really optional (I personally run the starting script from my project's folder).
```
bash startCropsPokyCont.sh
```

## Authors <a name = "authors"></a>

- [@armhzjz](https://github.com/armhzjz)

Any hint or advice on how this could be improved are welcome!
