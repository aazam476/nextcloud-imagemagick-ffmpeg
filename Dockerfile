FROM nextcloud

MAINTAINER ali azam <ali@azam.email>

EXPOSE 80:80/tcp

RUN apt-get update \
    && apt-get -y install imagemagick ffmpeg
