
function platform_deps() {
  sudo apt-get install -y \
      pkg-config \
      git \
      subversion \
      curl \
      wget \
      build-essential \
      python2 \
      xz-utils \
      zip \
      ninja-build

  if [ "${ARCH}" == "arm64" ]; then
    sudo apt-get install -y crossbuild-essential-arm64
    export CC_target=aarch64-linux-gnu-gcc
    export CXX_target=aarch64-linux-gnu-g++
    export CC_host="gcc"
    export CXX_host="g++"
    export CC="${CC_target}"
    export CXX="${CXX_target}"
    export NODE_CONFIGURE_FLAGS="--with-arm-float-abi=hard --with-arm-fpu=neon"
  fi

  if [ "${ARCH}" == "arm" ]; then
    sudo apt-get install -y crossbuild-essential-armhf
    export CC_target=arm-linux-gnueabihf-gcc
    export CXX_target=arm-linux-gnueabihf-g++
    export CC_host="gcc -m32"
    export CXX_host="g++ -m32"
    export CC="${CC_target}"
    export CXX="${CXX_target}"
    export NODE_CONFIGURE_FLAGS="--with-arm-float-abi=hard --with-arm-fpu=neon"
  fi

  if [ "${ARCH}" == "x86" ]; then
    sudo apt-get install -y crossbuild-essential-i386
  fi
}
