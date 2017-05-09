include .make

.DEFAULT_GOAL := help

## Print this help
help:
	@awk -v skip=1 \
		'/^##/ { sub(/^[#[:blank:]]*/, "", $$0); doc_h=$$0; doc=""; skip=0; next } \
		 skip  { next } \
		 /^# /  { doc=doc "\n" substr($$0, 3); next } \
		 /:/   { sub(/:.*/, "", $$0); printf "\033[34m%-30s\033[0m\033[1m%s\033[0m %s\n\n", $$0, doc_h, doc; skip=1 }' \
		$(MAKEFILE_LIST)

## Install local dependencies
deps: deps_git

## Setup git
deps_git:
	.git-local/install

# Creates empty `.make` if it does not exist
.make:
	touch .make
