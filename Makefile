all: format

clean:
	@rm -rf plugin/packer_compiled.lua ~/.local/share/nvim/ ~/.local/state/nvim
	$(info --- cleaned neovim artifacts)

deps:
	luarocks install --server https://luarocks.org/dev luaformatter

format:
	find . -name '*.lua' -print -exec lua-format --config $$(PWD)/.lua_format.yml --in-place {} \+
	$(info --- formatted files)

update: clean
	git pull --autostash --quiet
	$(info --- fetched latest changes)
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	$(info --- synced packer config)
	#nvim --headless -c "autocmd User PackerComplete :qall"
	$(info --- updated packer)

.PHONY: clean deps format test update
.SILENT: clean deps format test update
