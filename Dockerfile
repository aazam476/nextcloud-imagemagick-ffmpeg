FROM nextcloud

MAINTAINER ali azam <ali@azam.email>

EXPOSE 80:80/tcp

RUN apt-get update \
    && apt-get install -y \
    imagemagick \
    ffmpeg \
    libbz2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install bz2
