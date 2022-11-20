.DEFAULT_GOAL := help

include makefiles/colors.mk
include makefiles/help.mk
include makefiles/macros.mk

#------------------------------------
# Installation
#------------------------------------

BIN_DIR := /usr/local/bin

SHFMT_VERSION := 3.4.3
SHFMT_PATH    := $(BIN_DIR)/shfmt

.PHONY: install-shfmt
## Install shfmt | Installation
install-shfmt:
	$(call print,Installing shfmt)
	@sudo curl https://github.com/mvdan/sh/releases/download/v$(SHFMT_VERSION)/shfmt_v$(SHFMT_VERSION)_linux_amd64 -Lo $(SHFMT_PATH)
	@sudo chmod +x $(SHFMT_PATH)

SHELLCHECK_VERSION := 0.8.0
SHELLCHECK_PATH    := $(BIN_DIR)/shellcheck
SHELLCHECK_TMP_DIR := $(shell mktemp -d)
SHELLCHECK_ARCHIVE := shellcheck.tar.xz

.PHONY: install-shellcheck
## Install shellcheck
install-shellcheck:
	$(call print,Installing shellcheck)
	@cd $(SHELLCHECK_TMP_DIR) \
		&& curl https://github.com/koalaman/shellcheck/releases/download/v$(SHELLCHECK_VERSION)/shellcheck-v$(SHELLCHECK_VERSION).linux.x86_64.tar.xz -Lo $(SHELLCHECK_ARCHIVE) \
		&& tar -xf $(SHELLCHECK_ARCHIVE) \
		&& sudo cp shellcheck-v$(SHELLCHECK_VERSION)/shellcheck $(SHELLCHECK_PATH)

HADOLINT_VERSION := 2.10.0
HADOLINT_PATH    := $(BIN_DIR)/hadolint

.PHONY: install-hadolint
## Install hadolint
install-hadolint:
	$(call print,Installing hadolint)
	@sudo curl https://github.com/hadolint/hadolint/releases/download/v$(HADOLINT_VERSION)/hadolint-Linux-x86_64 -Lo $(HADOLINT_PATH)
	@sudo chmod +x $(HADOLINT_PATH)

ACTIONLINT_VERSION := 1.6.13
ACTIONLINT_PATH    := $(BIN_DIR)/actionlint
ACTIONLINT_URL     := https://github.com/rhysd/actionlint/releases/download/v$(ACTIONLINT_VERSION)/actionlint_$(ACTIONLINT_VERSION)_linux_amd64.tar.gz
ACTIONLINT_TMP_DIR := $(shell mktemp -d)
ACTIONLINT_ARCHIVE := actionlint.tar.gz

.PHONY: install-actionlint
## Install actionlint
install-actionlint:
	$(call print,Installing actionlint)
	@cd $(ACTIONLINT_TMP_DIR) \
		&& curl $(ACTIONLINT_URL) -Lo $(ACTIONLINT_ARCHIVE) \
		&& tar -xvf $(ACTIONLINT_ARCHIVE) \
		&& sudo mv actionlint $(ACTIONLINT_PATH)

.PHONY: install-linters-binaries
## Install linters binaries
install-linters-binaries: install-shfmt install-hadolint install-actionlint install-shellcheck

HUGO_VERSION=0.97.0

.PHONY: install
## Install hugo
install:
	$(call print,Installing Hugo)
	@cd /tmp && \
	wget https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz -O hugo.tar.gz && \
	tar -xvf hugo.tar.gz && \
	sudo mv ./hugo $(BIN_DIR)/

.PHONY: install-pre-commit
## Install pre-commit
install-pre-commit:
	$(call print,Installing pre-commit)
	@sudo pip3 install pre-commit

.PHONY: setup-pre-commit
## Set up pre-commit. Activate git hooks
set-up-pre-commit:
	$(call print,Setting up pre-commit)
	@pre-commit install

.PHONY: uninstall
## Uninstall hugo
uninstall:
	$(call print,Uninstalling Hugo)
	@sudo rm $(BIN_DIR)/hugo

.PHONY: init-submodule
## Initialize git submodule
init-submodule:
	$(call print,Initializing git submodule)
	@git submodule init

.PHONY: update-submodule
## Update git submodule
update-submodule:
	$(call print,Updating git submodule)
	@git submodule update

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
	@git submodule update --remote themes/minimal

.PHONY: lint
## Run linters
lint:
	$(call print,Running linters)
	@rst-lint README.rst
	@actionlint
	@pre-commit run --all-files

.PHONY: find-broken-links
## Find broken links
find-broken-links:
	$(call print,Finding broken links)
	@markdown-link-check content/posts/*.md -c .markdown-link-check.json -p
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
	@scripts/new_post.sh $(NEW_POST_ARGS)

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
	@scripts/new_post.sh $(POST_ARGS)

.PHONY: preview
## Preview
preview:
	$(call print,Previewing)
	@hugo server -D

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
	@docker build -t blog .

.PHONY: docker-run
## Run docker run
docker-run:
	$(call print,Running docker run)
	@docker run -p 8000:80 blog

.PHONY: docker-sh
## Run docker shell
docker-sh:
	$(call print,Running docker shell)
	@docker run -ti blog sh
#------------------------------------

#------------------------------------
# Scripts
#------------------------------------
.PHONY: flush-cdn-cache
flush-cdn-cache:
	$(call print,Running flush CDN cache script)
	@scripts/flush_cdn_cache.sh
#------------------------------------
