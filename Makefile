.SILENT:
.DEFAULT_GOAL := help

include makefiles/colors.mk
include makefiles/help.mk
include makefiles/macros.mk
include makefiles/deps.mk
include makefiles/helpers.mk

#------------------------------------
# Installation
#------------------------------------

.PHONY: install-linters-binaries
## Install linters binaries | Installation
install-linters-binaries: .install-shfmt .install-hadolint .install-actionlint .install-shellcheck

HUGO_VERSION := 0.107.0

.PHONY: install
## Install hugo
install:
	$(call print,Installing Hugo)
	cd /tmp && \
	wget https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz -O hugo.tar.gz && \
	tar -xvf hugo.tar.gz && \
	sudo mv ./hugo $(BIN_DIR)/

PRE_COMMIT_VERSION := 2.20.0

.PHONY: install-pre-commit
## Install pre-commit
install-pre-commit:
	$(call print,Installing pre-commit)
	sudo pip3 install pre-commit==$(PRE_COMMIT_VERSION)

.PHONY: setup-pre-commit
## Set up pre-commit. Activate git hooks
set-up-pre-commit:
	$(call print,Setting up pre-commit)
	pre-commit install

.PHONY: uninstall
## Uninstall hugo
uninstall:
	$(call print,Uninstalling Hugo)
	sudo rm $(BIN_DIR)/hugo

.PHONY: init-submodule
## Initialize git submodule
init-submodule:
	$(call print,Initializing git submodule)
	git submodule init

.PHONY: update-submodule
## Update git submodule
update-submodule:
	$(call print,Updating git submodule)
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
	$(call print,Updating Minimal theme)
	git submodule update --remote themes/minimal

.PHONY: format
## Format files
format: .pre-commit
	$(call print,Formatting files)

.PHONY: lint
## Run linters
lint: .pre-commit
	$(call print,Running linters)
	rst-lint README.rst
	actionlint

.PHONY: find-broken-links
## Find broken links
find-broken-links:
	$(call print,Finding broken links)
	markdown-link-check content/posts/*.md -c .markdown-link-check.json -p

#------------------------------------

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
	$(call print,Creating new post `$(NEW_POST_ARGS)`)
	scripts/new_post.sh $(NEW_POST_ARGS)

ifeq (post,$(firstword $(MAKECMDGOALS)))
# Use the rest as arguments
POST_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
# Turn them into do-nothing targets
$(eval $(POST_ARGS):;@:)
endif

.PHONY: post
## Create a new post. Usage: [post_name]. (Alias for new-post)
post:
	$(call print,Creating new post `$(POST_ARGS)`)
	scripts/new_post.sh $(POST_ARGS)

.PHONY: preview
## Preview
preview:
	$(call print,Previewing)
	hugo server -D

.PHONY: run
## Preview (preview alias)
run: preview

#------------------------------------

#------------------------------------
# Docker commands
#------------------------------------

.PHONY: docker-build
## Run docker build | Docker
docker-build:
	$(call print,Building Docker image)
	docker build -t blog .

.PHONY: docker-run
## Run docker run
docker-run:
	$(call print,Running docker run)
	docker run -p 8000:80 blog

.PHONY: docker-sh
## Run docker shell
docker-sh:
	$(call print,Running docker shell)
	docker run -ti blog sh

#------------------------------------

#------------------------------------
# Scripts
#------------------------------------

.PHONY: flush-cdn-cache
flush-cdn-cache:
	$(call print,Running flush CDN cache script)
	scripts/flush_cdn_cache.sh

#------------------------------------
