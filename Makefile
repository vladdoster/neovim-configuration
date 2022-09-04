all: format

clean:
	rm -rvf plugin/packer_compiled.lua ~/.local/share/nvim/ ~/.local/state/nvim
	$(info --- cleaned neovim artifacts)

deps:
	luarocks install --server https://luarocks.org/dev luaformatter

format:
	find . -name '*.lua' -print -exec lua-format --config $(CURDIR)/.lua_format.yml --in-place {} \+
	$(info --- formatted files)

update: clean
	git pull --autostash --quiet
	nvim --headless -c "autocmd User PackerComplete :qall"
	$(info --- fetched latest changes)
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

.PHONY: all clean deps format test update
.SILENT: all clean deps format update
