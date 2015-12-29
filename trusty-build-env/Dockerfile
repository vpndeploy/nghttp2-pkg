FROM ftao/nghttp2-pkg:trusty-fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
        g++ make binutils autoconf automake autotools-dev libtool pkg-config \
        zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev \
        libjemalloc-dev cython python-dev python-setuptools \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /build

WORKDIR /build
