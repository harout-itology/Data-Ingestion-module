open: ## Host Opens shell
	docker exec -it dim-php bash

run: ## Run the application
	docker-compose up --build -d
	docker exec dim-php composer install
	docker exec dim-php ./artisan migrate

install: ## Install the application
	cp .env.example .env
	docker-compose up --build -d
	docker exec dim-php composer install
	docker exec dim-php ./artisan migrate
	docker exec dim-php ./artisan key:generate

