local M = {}
local cmd = vim.cmd
M.setup = function()
	cmd(
		[[au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
	)
	cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]])
	cmd([[ au InsertEnter * set norelativenumber ]])
	cmd([[ au InsertLeave * set relativenumber ]])
end
M.setup()
return M
