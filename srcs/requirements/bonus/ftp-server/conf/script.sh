#!/bin/bash

chown $FTP_USER:$FTP_USER /home/$FTP_USER/FTP/wordpress
chmod 777 /home/$FTP_USER/FTP/wordpress

vsftpd /etc/vsftpd.conf
