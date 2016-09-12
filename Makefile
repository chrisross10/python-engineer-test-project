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

db: build_db run_db

build_db:
	docker build -t postgres_db -f Dockerfile.db .

run_db:
	docker run \
	-p 5433:5432 \
	-e POSTGRES_USER=chrisr \
	-e POSTGRES_PASSWORD=chrisr \
	-e POSTGRES_DB=chrisr \
	postgres_db

