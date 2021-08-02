-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
	[[
   au TermOpen term://* setlocal nonumber laststatus=0
   au TermClose term://* bd!
]],
	false
)

-- we can load shada now
vim.opt.shadafile = ""
