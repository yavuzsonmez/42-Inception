# Small Docker compose infrastructure


## NGINX
Web server with TLS encryption proxying request to different containers

## WORDPRESS - PHP-FPM
Wordpress on a volume configured with the Wordpress CLI, and php-fpm (fastcgi process manager) listening on port 9000.

## MARIADB
Simple sql server database for wordpress running on port 3306.
Create a specific user with password for the wordpress db.
Disable root access without password.

---

## VSFTPD
VSFTPD server binded to the wordpress volume for file transfering.
Modern and secure version of FTP with TLS encryption between the client and the server.

## ADMINER
Web user interface for database management, running on port 8080.

## REDIS-CACHE

## STATIC-WEB-APP
A simple single page app (pomodoro) served with express server on port 5000.

## DOZZLE
Real-time log viewer for docker containers.

---

### Some notes to check the project

-> Database check persistency <-
mysql -u MYSQL_USER -pMYSQL_PASSWORD
show DATABASES;
use WORDPRESS_DB;
show tables;
SELECT * FROM wp_comments;


-> add 127.0.0.1 ysonmez.42.fr in /etc/hostname in hostmachine
-> sudo sh -c 'echo "127.0.0.1 ysonmez.42.fr" >> /etc/hosts'
-> same for localhost


-> install filezilla (ftp) client on the host machine <-
-> Connect to the ftp server with the ftp client from the host machine <-
sudo docker exec -it VSFTPD bash
ip addr
connect with this ip addr because the containers name cannot be used because the host machine is out of the docker-compose inception network.


-> PORTS <-
4242 on VM to 443 on NGINX (Nginx with TLSv1.3 container) (HTTPS)
        Nginx forward to fastcgi_pass location:
            WORDPRESS:9000
                Wordpress communicate with database via MARIADB:3306
            ADMINER:8080
5000 on VM to 5000 on POMODORO (Express server container) (HTTP)

-> PORTS with the vscode Docker extension for better testing <-
whatever on physical computer to 4242 on VM (nginx)
whatever on physical computer to 5000 on VM (express server)

-> SERVICES <-

WORDPRESS
    https://localhost:4242/
    https://ysonmez.42.fr:4242/ (connect and post comment with WP_USER / WP_USER_PASSWORD)
    https://localhost:4242/wp-login.php (connect and administrate with WP_ADMIN_PASSWORD / WP_ADMIN_MAIL)

MARIADB
    (as root) mysql -u root -pMYSQL_ROOT_PASSWORD=qiHwngkqp
    (as normal user) mysql -u MYSQL_USER -pMYSQL_PASSWORD

ADMINER
    https://localhost:4242/adminer
    connect to DB with MARIADB / MYSQL_USER / MYSQL_PASSWORD

VSFTPD
    Connect to the VSFTPD server from the host machine via a FTP client (Filezilla) or a browser (ftp://)
    Connect with VSFTPD server ip address of VSFTPD container on the local network and FTP_USER / FTP_PASSWORD

POMODORO
    http://localhost:5000


-->TODO change volume path at 42 and create the directory /data/wordpress /data/mariadb /data/adminer