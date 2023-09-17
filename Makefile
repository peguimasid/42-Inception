name = inception

all:
	@printf "Launch configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

re: clean all

stop:
	@printf "Stopping containers ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml stop

clean: stop
	@printf "Cleaning configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down -v

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build stop re clean fclean
