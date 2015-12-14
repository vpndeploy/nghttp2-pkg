FROM ftao/nghttp2-pkg:trusty-fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
        g++ make binutils autoconf automake autotools-dev libtool pkg-config \
        zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev \
        libjemalloc-dev cython python-dev python-setuptools \
    && rm -rf /var/lib/apt/lists/* \
        && wget https://github.com/tatsuhiro-t/nghttp2/releases/download/v1.5.0/nghttp2-1.5.0.tar.gz \
        && tar -xzf nghttp2-1.5.0.tar.gz \
        && cd nghttp2-1.5.0 && ./configure && make  \
        && mkdir -p /tmp/fakeroot/usr/local/lib/python2.7/site-packages \
        && PYTHONPATH=/tmp/fakeroot/usr/local/lib/python2.7/site-packages make DESTDIR=/tmp/fakeroot install \
        && mkdir -p /tmp/dist \
        && fpm -s dir -t deb -n nghttp2 -v 1.5.0 -C /tmp/fakeroot -p /tmp/dist/nghttp2_VERSION_ARCH.deb \
        -d "libssl1.0.0 >= 1.0.1" \
        -d "libev4 >= 4.15" \
        -d "zlib1g >= 1.2.3" \
        -d "libxml2 >= 2.7.7" \
        -d "libjansson4 >= 2.5" \
    && rm -rf /tmp/fakeroot \
        && rm -rf nghttp2-1.5.0.tar.gz \
        && rm -rf nghttp2-1.5.0
