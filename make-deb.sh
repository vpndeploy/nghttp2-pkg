#!/bin/sh
BUILD_DIR=$1
VERSION=$2
wget https://github.com/tatsuhiro-t/nghttp2/releases/download/v$VERSION/nghttp2-$VERSION.tar.gz 
tar -xzf nghttp2-$VERSION.tar.gz

DEST_DIR=$BUILD_DIR/fakeroot

PYTHONPATH=$DEST_DIR/usr/local/lib/python2.7/site-packages
mkdir -p $PYTHONPATH
cd nghttp2-$VERSION
./configure
make
PYTHONPATH=$PYTHONPATH make DESTDIR=$DEST_DIR install

mkdir -p $BUILD_DIR/deb
fpm -s dir -t deb -n nghttp2 -v $VERSION -C $DEST_DIR -p $BUILD_DIR/deb/nghttp2_VERSION_ARCH.deb \
    -d "libssl1.0.0 >= 1.0.1" \
    -d "libev4 >= 4.15" \
    -d "zlib1g >= 1.2.3" \
    -d "libxml2 >= 2.7.7" \
    -d "libjansson4 >= 2.5"
