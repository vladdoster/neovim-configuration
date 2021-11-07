
fmt:
	@find . -name '*.lua' -print -exec \
	lua-format --in-place \
	           --align-parameter \
             --no-break-after-table-lb \
             --no-break-before-table-rb \
	           --align-table-field \
	           --chop-down-kv-table \
	           --chop-down-table \
	           --column-limit=120 \
	           --column-table-limit 100 \
	           --double-quote-to-single-quote \
	           --keep-simple-control-block-one-line \
	           --keep-simple-function-one-line \
	           --no-break-after-functioncall-lp \
	           --no-extra-sep-at-table-end \
	           --no-spaces-around-equals-in-field \
	           --no-spaces-inside-table-braces \
	           {} \;
