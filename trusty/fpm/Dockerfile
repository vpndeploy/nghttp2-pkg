FROM buildpack-deps:trusty

RUN apt-get update && apt-get install -y --no-install-recommends \
        ruby-dev \
    && rm -rf /var/lib/apt/lists/* \
    && gem install fpm
