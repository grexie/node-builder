
function platform_deps() {
  brew install ccache
  export CC_host="ccache cc -arch $(uname -m)"
  export CXX_host="ccache c++ -arch $(uname -m)"
  export CC_target="ccache cc -arch ${ARCH}"
  export CXX_target="ccache c++ -arch ${ARCH}"
  export CC=${CC_target}
  export CXX=${CXX_target}
}
