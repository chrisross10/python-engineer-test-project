DOCKER_TAG=app

default: build

build:
	docker-compose build $(DOCKER_TAG)

run:
	docker-compose run --service-ports $(DOCKER_TAG)

test:
	docker-compose run $(DOCKER_TAG) python -m unittest discover tests
