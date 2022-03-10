vim.g.did_load_filetypes = 0 -- Disable vim-based filetype plugin
vim.g.do_filetype_lua = 1 -- Enable lua-based filetype plugin

-- vim.cmdustom filetypes
vim.filetype.add({
	extension = { eslintrc = "json", prettierrc = "json", conf = "conf", mdx = "markdown" },
	pattern = {
		[".*%.env.*"] = "sh",
		[".*ignore"] = "conf",
		-- ['.*tmux.*conf$'] = 'tmux',
	},
	filename = { ["yup.lock"] = "yaml" },
})

vim.cmd(
	[[au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
)
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- Stop new line comments.
vim.cmd([[au InsertEnter * set norelativenumber ]])
vim.cmd([[au InsertLeave * set relativenumber ]])
vim.cmd([[au TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})]])
vim.cmd([[augroup _markdown
        autocmd!
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal spell
    augroup end
    ]])
