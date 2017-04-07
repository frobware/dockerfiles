NAME = $(shell basename $$PWD)

build:
	docker build -t frobware/$(NAME) .

run:
	docker run -it -v /tmp:/target frobware/$(NAME)

clean:
	docker rmi frobware/$(NAME)
