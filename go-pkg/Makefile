NAME = $(shell basename $$PWD)

build:
	docker build --rm=false -t frobware/$(NAME) .

run:
	docker run --rm=false -v /tmp:/target frobware/$(NAME)

clean:
	docker rmi frobware/$(NAME)
