.PHONY: all clean deps format update
.SILENT: all clean deps format update

all: help

help: ## Display all Makfile targets
	@grep -E '^.*[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

clean: ## Remove installed plugins & packer artifacts
	rm -rf ./plugin/packer_compiled.lua ~/.local/share/nvim ~/.local/state/nvim
	$(info --- cleaned neovim artifacts)

deps: ## Install lua-formatter system-wide
	luarocks install --local --server https://luarocks.org/dev luaformatter
	$(info --- installed lua-formatter)

format: ## Run lua-formatter using .lua_format.yml config
	find . -name '*.lua' -type f -not -path '**/packer_compiled.lua' -print -exec lua-format --config $(CURDIR)/.lua_format.yml --in-place {} \+
	$(info --- formatted files)

update: | clean ## Run clean target, pull git changes, and re-install plugins
	git pull --autostash --quiet
	$(info --- fetched latest changes)
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

targets-table:
	@printf "|Target|Descripton|\n|---|---|\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "| %s| %s |\n", $$1, $$2}'

update-readme: ## Update Make targets table in README
	sed -i -E '/^|/d' README.md
	make targets-table | mdformat - >> README.md

# vim: set fenc=utf8 ffs=unix ft=make list noet sw=4 ts=4 tw=72:
