NAME = $(shell basename $$PWD)

build:
	docker build -t frobware/$(NAME) .

run:
	docker run -ti frobware/$(NAME) /bin/bash

clean:
	docker rmi frobware/$(NAME)
