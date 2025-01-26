# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hhagiwar <hhagiwar@tokyo.42.school>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/26 20:52:27 by hhagiwar          #+#    #+#              #
#    Updated: 2025/01/26 20:52:34 by hhagiwar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Makefile

# Configuration
COMPOSE = docker-compose -f srcs/docker-compose.yml

# Primary Control Targets
# -----------------------
all : up

# Docker Compose Commands
# -----------------------
up :
	@$(COMPOSE) up -d

down :
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
