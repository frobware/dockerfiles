NAME = $(shell basename $$PWD)

build:
	docker build --rm=false --tag frobware/$(NAME) .

run:
	@docker run -it -e TERM=$$TERM -v /tmp/.X11-unix:/tmp/.X11-unix -v $$HOME:/workdir frobware/$(NAME)

clean:
	-docker rmi frobware/$(NAME)
