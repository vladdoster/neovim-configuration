
fmt:
	@find . -name '*.lua' -print -exec \
		lua-format \
		--config lua_format.yml \
		--in-place \
		-- {} \;

install-lua-formatter:
	luarocks install --server=https://luarocks.org/dev luaformatter

clean:
	find . -name 'packer_compiled*' -type f -print -delete
	find $$HOME/.local/share/ -maxdepth 1 -name 'nvim' -type d -print -delete
