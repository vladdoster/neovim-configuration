all: fmt

clean:
	@find . -name 'packer_compiled*' -type f -delete
	@find $$HOME/.local/share/ \
		-maxdepth 1 \
		-name 'nvim' \
		-type d \
		-exec rm -rf {} \
	\;
	$(info cleaned neovim artifacts)

deps:
	luarocks install \
		--server https://luarocks.org/dev luaformatter

fmt:
	@find . -name '*.lua' -print0 \
	| xargs -0 -n1 -P4 \
		lua-format \
			--config .lua_format.yml \
			--in-place
	$(info formatted files)

test:
	./scripts/test

update: clean
	git pull --autostash --quiet
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	$(info -- updated nvim configuration)

.PHONY: clean deps fmt test update
.SILENT: clean deps fmt test update
