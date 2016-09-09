DOCKER_TAG=app

default: lint test

build:
	docker-compose build $(DOCKER_TAG)

run:
	docker-compose run \
	--service-ports \
	$(DOCKER_TAG)

test:
	docker-compose run \
	$(DOCKER_TAG) \
	python -m unittest discover tests

lint:
	docker-compose run \
	$(DOCKER_TAG) \
	pylint --rcfile=.pylintrc tests teams *.py
