local auto_commands = {}

function reload_config()
	vim.cmd("source ~/.config/nvim/lua/options.lua")
	vim.cmd("source ~/.config/nvim/lua/plugins.lua")
	vim.cmd(":PackerCompile")
	vim.cmd(":PackerSync")
end

function define_augroups(definitions) -- {{{1
	-- Create autocommand groups based on the passed definitions
	--
	-- The key will be the name of the group, and each definition
	-- within the group should have:
	--    1. Trigger
	--    2. Pattern
	--    3. Text
	-- just like how they would normally be defined from Vim itself
	for group_name, definition in pairs(definitions) do
		vim.cmd("augroup " .. group_name)
		vim.cmd("autocmd!")

		for _, def in pairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.cmd(command)
		end

		vim.cmd("augroup END")
	end
end

define_augroups({
	_user_autocommands = O.user_autocommands,
	_general_settings = {
		{ "TextYankPost", "*", "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})" },
		{ "BufWinEnter", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
		{ "BufRead", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
		{ "BufNewFile", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
		{ "BufWritePost", "plugins.lua", "lua require('auto-commands').reload_config()" },
	},
	_terraform = {
		{ "BufWinEnter", ".tf", "setlocal filetype=hcl" },
		{ "BufRead", "*.tf", "setlocal filetype=hcl" },
		{ "BufNewFile", "*.tf", "setlocal filetype=hcl" },
	},
	_markdown = { { "FileType", "markdown", "setlocal wrap" }, { "FileType", "markdown", "setlocal spell" } },
	_buffer_bindings = { { "FileType", "floaterm", "nnoremap <silent> <buffer> q :q<CR>" } },
	_auto_resize = {
		-- will cause split windows to be resized evenly if main window is resized
		{ "VimResized", "*", "wincmd =" },
	},
	_packer_compile = {
		-- will cause split windows to be resized evenly if main window is resized
		{ "BufWritePost", "plugins.lua", "PackerCompile" },
	},
})

return auto_commands
