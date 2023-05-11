**Nextcloud Docker with ImageMagick & FFmpeg**
=============
This docker image is supported by the Docker-Sponsored Open Source program and should now be built whenever Nextcloud updates.

Even though the last commit on this repository may be old, unless stated so, this project is still being mantained. No commits just mean that there is nothing for me to update.
___
If you would like to support this project, you can donate here:

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate?business=P7FNV8MU6ECR6&no_recurring=0&item_name=To+Keep+Projects%2C+Like+Pi-Hole+DOH%2C+Alive&currency_code=USD)
___
Docker Compose:
```yml
version: '2'

services:
  db:
    image: mariadb:latest
    container_name: nextcloud-mariadb
    restart: unless-stopped
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW --innodb_read_only_compressed=OFF
    volumes:
      - ./db-config:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=[ROOT PASSWORD]
      - MYSQL_PASSWORD=[DATABASE PASSWORD]
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud

  app:
    image: azamserver/nextcloud-imagemagick-ffmpeg:latest
    container_name: nextcloud-nextcloud
    restart: unless-stopped
    ports:
      - 80:80
    links:
      - db
    volumes:
      - ./config:/var/www/html
      - ./data:/var/www/html/data
    environment:
      - MYSQL_PASSWORD=[DATABASE PASSWORD]
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_HOST=db
      - PHP_MEMORY_LIMIT=4G
```
____
For those wondering, this is the Dockerfile file for this docker:
```yml
FROM nextcloud

MAINTAINER ali azam <ali@azam.email>

EXPOSE 80:80/tcp

RUN apt-get update \
    && apt-get -y install imagemagick ffmpeg
```
___
Contact:

Name: Ali Azam

Email: ali@azam.email
