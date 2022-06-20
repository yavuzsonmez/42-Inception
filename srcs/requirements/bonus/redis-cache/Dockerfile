FROM debian:buster

LABEL maintainer="contact@yavuzsonmez.com"

EXPOSE 6379

RUN apt-get update -y
RUN apt full-upgrade -y

RUN apt-get install redis-server -y

RUN mkdir /var/run/redis

RUN mv /etc/redis/redis.conf /etc/redis/redis.conf.bak
COPY ./conf/redis.conf /etc/redis/redis.conf

COPY ./conf/script.sh ./script.sh
RUN chmod +x script.sh

CMD ["bash", "./script.sh"]