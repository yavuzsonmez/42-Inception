# ------------------------> Build main services <------------------------

inception       :       db wp adminer nginx

# ------------------------> Build main + additionnal services <------------------------

bonus           :       inception app ftp adminer redis dozzle

# ------------------------> Build and instantiate a single main service <------------------------

nginx           :
						sudo docker compose --file ./srcs/docker-compose.yml up --detach nginx

wp              :
						sudo docker compose --file ./srcs/docker-compose.yml up --detach wordpress

db              :
						sudo docker compose --file ./srcs/docker-compose.yml up --detach mariadb

# ------------------------> Build and instantiate a single additionnal service <------------------------

app             :
						sudo docker compose --file ./srcs/docker-compose.yml up --detach static-webpage

ftp             :
						sudo docker compose --file ./srcs/docker-compose.yml up --detach ftp-server

adminer         :
						sudo docker compose --file ./srcs/docker-compose.yml up --detach adminer

redis           :
						sudo docker compose --file ./srcs/docker-compose.yml up --detach redis-cache

dozzle          :
						sudo docker compose --file ./srcs/docker-compose.yml up --detach dozzle

# ------------------------> Redis-CLI monitoring <------------------------

redis-monitor   :
						sudo docker exec -it REDIS redis-cli monitor

# ------------------------> Show containers logs <------------------------

logs            :
						sudo docker compose --file ./srcs/docker-compose.yml logs

# ------------------------> List images, containers, volumes <------------------------

ls              :
						sudo docker image ls
						sudo docker ps --all
						sudo docker volume ls

# ------------------------> Stop containers <------------------------

stop            :
						sudo docker compose --file ./srcs/docker-compose.yml stop

# ------------------------> Stop and remove containers, network <------------------------

down            :
						sudo docker compose --file ./srcs/docker-compose.yml down

# ------------------------> Stop containers, removes images, networks, volumes <------------------------

rm              :
						sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v

# ------------------------> Remove unused <------------------------

prune           :
						sudo docker system prune --all --force

# ------------------------> Remove all <------------------------

clean           :       down prune rm

# ------------------------> Build - ReBuild <------------------------

all             :       inception

re              :       fclean all

.PHONY          :       clean fclean all re
