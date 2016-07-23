#!/bin/bash
OS=$1
VERSION=$2
#OS="trusty"
#VERSION="1.12.0"
CURRENT_DIR=`pwd`
OUT_DIR="$CURRENT_DIR/build/$OS"
SRC_FILE="$CURRENT_DIR/src/nghttp2-${VERSION}.tar.gz"
IMAGE="ftao/nghttp2-pkg:${OS}-build-env"
mkdir -p $OUT_DIR
docker run --rm -it\
   -v $SRC_FILE:/build/nghttp2-${VERSION}.tar.gz \
   -v $OUT_DIR:/build/deb \
   $IMAGE  \
   /build/nghttp2-${VERSION}.tar.gz $VERSION
