
fmt:
	@find . -name '*.lua' -print -exec \
	lua-format \
		--align-parameter \
		--align-table-field \
		--chop-down-kv-table \
		--chop-down-table \
		--column-limit=80 \
		--column-table-limit 80 \
		--double-quote-to-single-quote \
		--in-place \
		--keep-simple-control-block-one-line \
		--keep-simple-function-one-line \
		--no-break-after-functioncall-lp \
		--no-break-after-table-lb \
		--no-break-before-table-rb \
		--no-extra-sep-at-table-end \
		--no-spaces-around-equals-in-field \
		--no-spaces-inside-table-braces \
		{} \;

install-lua-formatter:
	luarocks install --server=https://luarocks.org/dev luaformatter
