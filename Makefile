.DEFAULT_GOAL := help

include help.mk

#------------------------------------
# Installation
#------------------------------------

.PHONY: install
## Install hugo | Installation
install:
	sudo apt install hugo -y

.PHONY: init-submodule
## Initialize git submodule
init-submodule:
	git submodule init

.PHONY: update-submodule
## Update git submodule
update-submodule:
	git submodule update

.PHONY: bootstrap
## Bootstrap
bootstrap: install init-submodule update-submodule
#------------------------------------

#------------------------------------
# Commands
#------------------------------------

.PHONY: update-minimal
## Update Minimal theme | Commands
update-minimal:
	git submodule update --remote themes/minimal

.PHONY: lint
## Run linters
lint:
	shfmt -l -d .
	shellcheck scripts/*.sh
	markdownlint README.md "content/posts/*.md"

.PHONY: format
## Format files
format:
	shfmt -l -w .
	markdownlint README.md "content/posts/*.md" --fix

#------------------------------------
# Hugo Commands
#------------------------------------
ifeq (new-post,$(firstword $(MAKECMDGOALS)))
  # Use the rest as arguments
  NEW_POST_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # Turn them into do-nothing targets
  $(eval $(NEW_POST_ARGS):;@:)
endif

.PHONY: new-post
## Create a new post. Usage: [post_name] | Hugo
new-post:
	scripts/new_post.sh ${NEW_POST_ARGS}

ifeq (post,$(firstword $(MAKECMDGOALS)))
  # Use the rest as arguments
  POST_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # Turn them into do-nothing targets
  $(eval $(POST_ARGS):;@:)
endif

.PHONY: post
## Create a new post. Usage: [post_name]
post:
	scripts/new_post.sh ${POST_ARGS}

.PHONY: preview
## Preview
preview:
	hugo server -D

.PHONY: run
## Preview
run: preview
#------------------------------------


#------------------------------------
# Docker commands
#------------------------------------

.PHONY: docker-build
## Run docker-build | Docker
docker-build:
	docker build -t blog .

.PHONY: docker-run
## Run docker-run
docker-run:
	docker run -p 8000:80 blog

.PHONY: docker-sh
## Run docker shell
docker-sh:
	docker run -ti blog sh
#------------------------------------
