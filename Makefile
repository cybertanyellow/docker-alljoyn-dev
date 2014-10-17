NAME = cybertanyellow/alljoyn-dev
VERSION = 0.1

.PHONY: all build test run

all: build

build:
	docker build -t $(NAME):$(VERSION) --rm .

test:
	docker run -it --rm $(NAME):$(VERSION) echo hello world!

run:
	docker run -P -it --rm --name $(subst /,-,$(NAME)) $(NAME):$(VERSION) /bin/bash

