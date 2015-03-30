NAME = $(shell basename $$PWD)

build:
	docker build -t frobware/$(NAME) .

run:
	docker run --rm --name go-tool-scraper frobware/$(NAME)
