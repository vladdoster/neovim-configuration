
fmt:
		@find . -name '*.lua' -print -exec \
				lua-format --in-place \
									 --double-quote-to-single-quote \
									 --align-table-field \
									 --no-extra-sep-at-table-end \
									 --no-spaces-around-equals-in-field \
									 --no-spaces-inside-table-braces \
									 --keep-simple-function-one-line \
									 --column-table-limit 100 \
									 --chop-down-table \
									 --break-after-functioncall-lp \
									 --align-parameter \
									 {} \;
