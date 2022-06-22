FROM debian:buster

LABEL maintainer="contact@yavuzsonmez.com"

ARG FTP_USER=${FTP_USER}
ARG FTP_PASSWORD=${FTP_PASSWORD}

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install vsftpd  -y
RUN apt-get install openssl -y

RUN adduser $FTP_USER
RUN echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
RUN echo $FTP_USER | tee -a  /etc/vsftpd.userlist

RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf etc/vsftpd.conf

RUN mkdir /etc/cert
RUN echo -e "DE\nDE\nHEILBRONN\n42\n42\nFTP\ninception@student.42heilbronn.de\n" | \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/cert/vsftpd.pem \
    -out /etc/cert/vsftpd.pem

COPY ./conf/script.sh ./script.sh
RUN chmod +x script.sh

CMD ["bash", "./script.sh"]
