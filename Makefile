.DEFAULT_GOAL := help

include help.mk

#------------------------------------
# Installation
#------------------------------------

SHFMT_VERSION := 3.4.3
SHFMT_PATH := /usr/local/bin/shfmt

.PHONY: install-shfmt
## Install shfmt | Installation
install-shfmt:
	sudo curl https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_linux_amd64 -Lo ${SHFMT_PATH}
	sudo chmod +x ${SHFMT_PATH}

HUGO_VERSION=0.97.0

.PHONY: install
## Install hugo
install:
	cd /tmp && \
	wget https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz -O hugo.tar.gz && \
	tar -xvf hugo.tar.gz && \
	sudo mv ./hugo /usr/local/bin/

.PHONY: uninstall
## Uninstall hugo
uninstall:
	sudo rm /usr/local/bin/hugo

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
	rst-lint README.rst
	yamllint .github deployment
	hadolint Dockerfile

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
## Run docker build | Docker
docker-build:
	docker build -t blog .

.PHONY: docker-run
## Run docker run
docker-run:
	docker run -p 8000:80 blog

.PHONY: docker-sh
## Run docker shell
docker-sh:
	docker run -ti blog sh
#------------------------------------
