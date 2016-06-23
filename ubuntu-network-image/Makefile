NAME = $(shell basename $$PWD)

build:
	docker build -t frobware/$(NAME) .

clean:
	docker rmi frobware/$(NAME)
