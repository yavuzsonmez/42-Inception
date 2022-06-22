FROM debian:buster

LABEL maintainer="contact@yavuzsonmez.com"

EXPOSE 8080

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y php7.3-fpm php7.3-mysql mariadb-client wget
RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN mkdir /run/php

ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /var/www/adminer/index.php

RUN chown -R www-data:www-data /var/www/adminer/index.php
RUN chmod 755 /var/www/adminer/index.php

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize", "--allow-to-run-as-root"]
