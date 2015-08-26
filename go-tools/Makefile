NAME = $(shell basename $$PWD)

build:
	docker build -t frobware/$(NAME) .

run:
	docker run -it -v /usr/local/bin:/target frobware/$(NAME)

clean:
	docker rmi frobware/$(NAME)
