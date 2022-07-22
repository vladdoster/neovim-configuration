all: format

clean:
	@find . -name 'packer_compiled*' -type f -delete
	@find $$HOME/.local/share/ \
		-maxdepth 1 \
		-name 'nvim' \
		-type d \
		-exec rm -rf \
		-- {} \;
	$(info --- cleaned neovim artifacts)

deps:
	luarocks install --server https://luarocks.org/dev luaformatter

format:
	find . -name '*.lua' -print
	find . -name '*.lua' -print0 \
	| xargs -0 -n1 -P4 \
		lua-format \
		--config $$(PWD)/.lua_format.yml \
		--in-place
	$(info --- formatted files)

update: clean
	git pull --autostash --quiet
	$(info --- fetched latest changes)
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	$(info --- synced packer config)
	nvim --headless -c "autocmd User PackerComplete :qall"
	$(info --- updated packer)

.PHONY: clean deps format test update
.SILENT: clean deps format test update
