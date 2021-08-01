local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

function autocmd.load_autocmds()
	local definitions = {
		window = {
			{ "VimResized", "*", [[tabdo wincmd =]] },
			-- Check if file changed when its window is focus, more eager than 'autoread'
			{ "FocusGained", "* checktime" },
		},
		file_type = { { "BufNewFile,BufRead", "*.toml", " setf toml" } },
		yank = {
			{
				"TextYankPost",
				[[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]],
			},
		},
		["vimrc-remember-cursor-position"] = {
			{
				"BufReadPost",
				[[* if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]],
			},
		},
	}

	autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
