
function platform_deps() {
  brew install ccache
  export CC_host="ccache cc -arch $(uname -m)"
  export CXX_host="ccache c++ -arch $(uname -m)"
  if [ "${ARCH}" == "x64" ]; then
    export CC_target="ccache cc -arch x86_64"
    export CXX_target="ccache c++ -arch x86_64"
  else
    export CC_target="ccache cc -arch ${ARCH}"
    export CXX_target="ccache c++ -arch ${ARCH}"
  fi
  export CC=${CC_target}
  export CXX=${CXX_target}
}
