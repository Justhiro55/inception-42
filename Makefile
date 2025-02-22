# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hhagiwar <hhagiwar@tokyo.42.school>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/26 20:52:27 by hhagiwar          #+#    #+#              #
#    Updated: 2025/02/23 06:12:40 by hhagiwar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Makefile

# Configuration
COMPOSE = docker compose -f srcs/docker-compose.yml
VOLUME = /home/hhagiwar/data
# VOLUME = /Users/hiro/Documents/42/inception-42/srcs/volumes/

# Primary Control Targets
# -----------------------
all : up

# Docker Compose Commands
# -----------------------
up :
	@mkdir -p $(VOLUME)/mariadb
	@mkdir -p $(VOLUME)/wordpress
	@mkdir -p $(VOLUME)/prometheus
# @mkdir -p $(VOLUME)/grafana
	@chmod 755 $(VOLUME)
	@chmod 755 $(VOLUME)/wordpress
	@chmod 755 $(VOLUME)/mariadb
	@chmod 755 $(VOLUME)/prometheus
# @chmod 777 $(VOLUME)/grafana
	@$(COMPOSE) build --no-cache
	@$(COMPOSE) up --build

down :
	@rm -rf $(VOLUME)
	@$(COMPOSE) down

stop :
	@$(COMPOSE) stop

start :
	@$(COMPOSE) start

# Utility
# -----------------------
logs:
	@$(COMPOSE) logs -f

status :
	@docker ps

clean:
	@docker stop $$(docker ps -qa) 2>/dev/null || true
	@docker rm $$(docker ps -qa) 2>/dev/null || true
	@docker rmi $$(docker images -qa) 2>/dev/null || true
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@docker network rm $$(docker network ls -q) 2>/dev/null || true
	@rm -rf $(VOLUME)

docker-restart:
	@echo "Restarting Docker Desktop..."
	@osascript -e 'quit app "Docker"'
	@sleep 5
	@open -a Docker
	@echo "Waiting for Docker to start..."
	@sleep 20

fclean: clean docker-restart
	@rm -rf $(VOLUME)

re: fclean docker-restart up
