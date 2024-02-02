FROM nextcloud

MAINTAINER ali azam <ali@azam.email>

EXPOSE 80:80/tcp

RUN apt-get update \
    && apt-get install -y \
    imagemagick \
    ffmpeg \
    php8.2-bz2 \
    && rm -rf /var/lib/apt/lists/*
