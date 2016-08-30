default: build

build:
	docker-compose build app

run:
	docker-compose run --service-ports app
