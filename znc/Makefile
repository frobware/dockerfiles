NAME = $(shell basename $$PWD)

build:
	docker build --rm=false --tag frobware/$(NAME) .

run:
	docker run -v $$HOME/.znc:/znc-data frobware/$(NAME)

clean:
	-docker rmi frobware/$(NAME)
