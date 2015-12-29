FROM buildpack-deps:wheezy

RUN apt-get update && apt-get install -y --no-install-recommends \
        ruby \
        ruby-dev \
    && rm -rf /var/lib/apt/lists/* \
    && gem install fpm
