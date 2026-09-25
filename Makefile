MAKEFLAGS += --silent
SHELL := $(shell command -v zsh 2> /dev/null)
.ONESHELL:

.PHONY: all clean deps format targets-table update update-readme

log=\e[32m==>\e[0m
all: help

help: ## Display all Makfile targets
	@grep -E '^.*[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

clean: ## Remove installed plugins & packer artifacts
	$(SHELL) -c 'print -f "==> %s\n" ~/.local/*/nvim(/N)'
	$(SHELL) -c 'rm -rf ~/.local/s[ht]*/nvim'
	echo "${log} cleaned neovim"

format: ## Run Stylua formatter
	stylua \
	--call-parentheses Input \
	--collapse-simple-statement Always \
	--column-width 120 \
	--glob **/*.lua \
	--indent-type Spaces \
	--line-endings Unix \
	--quote-style AutoPreferSingle \
	--sort-requires \
	--verbose

update: | clean ## Run clean target, pull git changes, and re-install plugins
	echo "${log} pulling upstream" && \
	git pull --autostash --quiet && \
	echo "${log} installing plugins" && \
	nvim --headless "+Lazy! sync" +qa

targets-table:
	printf "|Target|Descripton|\n|---|---|\n"
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "| %s| %s |\n", $$1, $$2}'

update-readme: ## Update Make targets table in README
	sed -i '' -e '/^|/d' README.md
	make targets-table | uvx --with mdformat-gfm mdformat - >> README.md

# vim: set fenc=utf8 ffs=unix ft=make list noet sw=4 ts=4 tw=72:
