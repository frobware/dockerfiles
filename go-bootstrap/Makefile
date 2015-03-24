NAME = $(shell basename $$PWD)
GOOS ?= linux
GOARCH ?= arm64
GIT_TREE_UPDATE ?= yes

build:
	docker build -t frobware/$(NAME) .

run:
	docker run -it \
		-e GIT_TREE_UPDATE=$(GIT_TREE_UPDATE) \
		-e X_GOOS=$(GOOS) \
		-e X_GOARCH=$(GOARCH) \
		-v /tmp:/target frobware/$(NAME)
