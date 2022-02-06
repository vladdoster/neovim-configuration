local o_s = vim.o
local g = vim.g
local function opt(o, v, scopes)
    scopes = scopes or {vim.o}
    for _, s in ipairs(scopes) do s[o] = v end
end
g.loaded_node_provider = 0;
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0;
g.loaded_python_provider = 0
g.python3_host_prog = '/usr/local/bin/python3'
opt('autoindent', true)
opt('background', 'dark')
opt('backup', false)
opt('clipboard', 'unnamedplus')
opt('cursorline', true)
opt('expandtab', true)
opt('ignorecase', true)
opt('incsearch', true)
opt('laststatus', 2)
opt('lazyredraw', false)
opt('linebreak', true)
opt('magic', false)
opt('mouse', 'a')
opt('number', true)
opt('ruler', false)
opt('scrolloff', 5)
opt('shiftwidth', 2)
opt('showmode', false)
opt('signcolumn', 'yes')
opt('smartcase', true)
opt('swapfile', false)
opt('tabstop', 2)
opt('termguicolors', true)
opt('ttyfast', true)
opt('undofile', true)
opt('updatecount', 0)
opt('updatetime', 50)
opt('writebackup', false)
vim.opt.guifont = 'UbuntuMono Nerd Font Mono:h16' -- set guifont for neovide
vim.opt.fillchars = {eob = ' '} -- disable tilde fringe
vim.opt.shortmess:append 'casI' -- disable intro
vim.opt.whichwrap:append '<>hl' -- clean aligned wraps
vim.api.nvim_set_keymap('n', 'k', 'v:count == 0 ? "gk" : "k"', {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', 'v:count == 0 ? "gj" : "j"', {noremap = true, expr = true, silent = true})
