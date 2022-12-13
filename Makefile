NAME	=	inception

#DIRECTORY

DC_LOCATION		= srcs/docker-compose.yml

DIR_MYSQL		= /home/jgao/data/mysql
DIR_WORDPRESS	= /home/jgao/data/wordpress

#COMPILATOR AND FLAG
MAKEFLAGS	+=	--no-print-directory
ENV			= --env-file srcs/.env

#COMMAND
RM		= rm -f

# COLOR
ifneq (,$(findstring xterm,${TERM}))
	BLACK			:= $(shell tput -Txterm setaf 0)
	RED				:= $(shell tput -Txterm setaf 1)
	GREEN			:= $(shell tput -Txterm setaf 2)
	YELLOW			:= $(shell tput -Txterm setaf 3)
	LIGHTPURPLE		:= $(shell tput -Txterm setaf 4)
	PURPLE			:= $(shell tput -Txterm setaf 5)
	BLUE			:= $(shell tput -Txterm setaf 6)
	WHITE			:= $(shell tput -Txterm setaf 7)
	BOLD 			:= $(shell tput bold)
	RESET			:= $(shell tput -Txterm sgr0)
else
	BLACK			:= ""
	RED				:= ""
	GREEN			:= ""
	YELLOW			:= ""
	LIGHTPURPLE		:= ""
	PURPLE			:= ""
	BLUE			:= ""
	WHITE			:= ""
	BOLD			:= ""
	RESET			:= ""
endif

all: ${NAME}

${NAME}:
	@echo "${LIGHTPURPLE}${BOLD}Creating directory for volume${RESET}"
	mkdir -p ${DIR_MYSQL}
	mkdir -p ${DIR_WORDPRESS}
	@echo "${LIGHTPURPLE}${BOLD}Doing docker compose things${RESET}"
	sudo docker-compose -f ${DC_LOCATION} ${ENV} up --build


clean:
	sudo docker-compose -f ${DC_LOCATION} ${ENV} down -v
	sudo rm -rf ${DIR_MYSQL}
	sudo rm -rf ${DIR_WORDPRESS}

fclean: clean


re:		fclean all

.PHONY: all clean fclean re
