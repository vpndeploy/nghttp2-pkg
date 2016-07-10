FROM buildpack-deps:trusty

RUN apt-get update && apt-get install -y --no-install-recommends \
        ruby-dev \
        g++ make binutils autoconf automake autotools-dev libtool pkg-config \
        zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev \
        libjemalloc-dev cython python-dev python-setuptools \
    && rm -rf /var/lib/apt/lists/* \
    && gem install fpm \
    && mkdir -p /build

ENV BUILD_DIR /build
WORKDIR ${BUILD_DIR}
ADD make-deb.sh /build/make-deb.sh
ENTRYPOINT ["/build/make-deb.sh"]
