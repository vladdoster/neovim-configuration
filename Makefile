SHELL := $(shell which zsh)
.ONESHELL:
.PHONY: all clean deps format update
.SILENT: all clean deps format update

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

deps: ## Install lua-formatter system-wide
	luarocks install --local --server https://luarocks.org/dev luaformatter
	echo "${log} installed lua-formatter"

format: ## Run lua-formatter using .lua_format.yml config
	stylua \
	--call-parentheses Input \
	--collapse-simple-statement Always \
	--column-width 120 \
	--glob **/*.lua \
	--indent-type Spaces \
	--line-endings Unix \
	--quote-style AutoPreferSingle \
	--verbose

update: | clean ## Run clean target, pull git changes, and re-install plugins
	echo "${log} pulling upstream" && \
	git pull --autostash --quiet && \
	echo "${log} installing plugins" && \
	nvim --headless "+Lazy! sync" +qa

targets-table:
	@printf "|Target|Descripton|\n|---|---|\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "| %s| %s |\n", $$1, $$2}'

update-readme: ## Update Make targets table in README
	sed -i -E '/^|/d' README.md
	make targets-table | mdformat - >> README.md

# vim: set fenc=utf8 ffs=unix ft=make list noet sw=4 ts=4 tw=72:
