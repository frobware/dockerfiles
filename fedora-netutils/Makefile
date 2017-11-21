NAME = $(shell basename $$PWD)

build:
	docker build -t frobware/$(NAME) .

run:
	docker run -it -v -- bash

clean:
	docker rmi frobware/$(NAME)
