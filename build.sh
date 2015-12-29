#!/bin/bash
CURRENT_DIR=`pwd`
OUT_DIR=$CURRENT_DIR/build/
VERSION=1.5.0
IMAGE="ftao/nghttp2-pkg:trusty-build-env"
mkdir -p $OUT_DIR
rm $OUT_DIR/*
docker run --rm \
   -v $CURRENT_DIR/make-deb.sh:/build/make-deb.sh -v $OUT_DIR:/build/deb \
   $IMAGE /build/make-deb.sh /build $VERSION
