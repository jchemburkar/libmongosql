# Copyright (c) MongoDB, Inc. 2018-present.

if [ "$PLATFORM" = '' ]; then
    if [ "$OS" = 'Windows_NT' ]; then
        PLATFORM=win64
    else
        PLATFORM=macos
    fi
    echo "WARNING: no value provided for \$PLATFORM: using default of '$PLATFORM'"
fi

case "$PLATFORM" in
macos)
    PLATFORM_ARCH='64'
    PLATFORM_NAME='darwin'
    CMAKE_PATH='/Applications/Cmake.app/Contents/bin'
    ;;
win32)
    PLATFORM_ARCH='32'
    PLATFORM_NAME='windows'
    CMAKE_PATH='/cygdrive/c/cmake/bin'
    CMAKE_GENERATOR='Visual Studio 12 2013'
    DEVENV_PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio 12.0/Common7/IDE'
    BISON_PATH='/cygdrive/c/bison/bin'
    ;;
win64)
    PLATFORM_ARCH='64'
    PLATFORM_NAME='windows'
    CMAKE_GENERATOR='Visual Studio 12 2013 Win64'
    CMAKE_PATH='/cygdrive/c/cmake/bin'
    DEVENV_PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio 12.0/Common7/IDE'
    BISON_PATH='/cygdrive/c/bison/bin'
    ;;
*)
    echo "ERROR: invalid value for \$PLATFORM: '$PLATFORM'"
    echo "Allowed values: 'win64', 'win32', 'macos'"
    exit 1
    ;;
esac
