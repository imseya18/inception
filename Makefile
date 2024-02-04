name = simple_nginx_html

all:
	@printf "Running Configuration ${name}...\n"
	@bash	./srcs/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@printf "Building the configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@printf "Stopping the configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@printf "Rebuilding the configuration ${name}...\n"
	@bash   ./srcs/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	@printf "Clearing configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY	: all build down re clean fclean
