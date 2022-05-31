-- Keymap method
local K = setmetatable({
  nore = { noremap = true, silent = true, expr = false },
  remap = { noremap = false, silent = true, expr = false },
}, {
  __index = function(p, mode)
    return setmetatable({
      map = function(key, action)
        vim.api.nvim_set_keymap(mode, key, action, p.remap)
      end,
      nmap = function(key, action)
        vim.api.nvim_set_keymap(mode, key, action, p.nore)
      end,
      bmap = function(buf, key, action)
        vim.api.nvim_buf_set_keymap(buf, mode, key, action, p.nore)
      end,
    }, {
      __call = function(this, key, action)
        this.nmap(key, action)
      end,
    })
  end,
})
--
-- Leader
local map = vim.api.nvim_set_keymap
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
--
-- ╭──────────────╮
-- │ INSERT ⮕ 'i' │
-- ╰──────────────╯
-- quick normal mode
K.i('jk', '<ESC>') --
-- ╭──────────────╮
-- │ NORMAL ⮕ 'n' │
-- ╰──────────────╯
--
-- buffer management
K.n('<leader>x', '<cmd>lua require("Buffers").only()<CR>')
K.n('<leader>X', '<cmd>lua require("Buffers").clear()<CR>')
K.n('<leader>q', '<cmd>lua require("Buffers").delete()<CR>') --
-- buffer navigation  {{{
K.n('<S-l>', ':bnext<cr>')
K.n('<S-h>', ':bprevious<cr>') -- }}}
-- disable ex mode
K.n('<Esc>', '<cmd> :noh <CR>')
K.n([[Q]], [[<Nop>]])
-- Disable command-line window
-- K.n([[q:]], [[<Nop>]])
-- K.n([[q/]], [[<Nop>]])
-- K.n([[q?]], [[<Nop>]])
-- Quickly enter substitution mode
K.n('<leader>/', '<cmd>:%s/<CR>')
K.n('<leader>?', '<cmd>:%S/<CR>')
K.v('<leader>/', '<cmd>:s/<CR>')
K.v('<leader>?', '<cmd>:S/<CR>')
-- edit configurations

-- comment-box
K.n('<leader>bc', [[<cmd>lua require('comment-box').accbox()<CR>]])
-- force quit
K.n('<C-q>', '<cmd>q!<cr>') --
-- force write
K.n('<C-s>', '<cmd>w!<cr>') --
-- gitsigns
K.v('<leader><Enter>', '<Plug>(EasyAlign)')
K.n('<leader><Enter>', '<Plug>(EasyAlign)')

-- lsp
K.n('<Leader>[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
K.n('<Leader>]d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
K.n('<Leader>gd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
K.n('<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
K.n('<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
K.n('<Leader>gj', '<cmd>lua vim.diagnostic.goto_next()<cr>')
K.n('<Leader>gk', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
K.n('<Leader>go', '<cmd>lua vim.diagnostic.open_float()<cr>')
K.n('<Leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')
K.n('<Leader>k', '<cmd>lua vim.lsp.buf.hover()<cr>')
K.n('<Leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
K.n('<Leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>')
K.n('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>') --
-- move text up and down
K.n('<A-j>', ':m .+1<cr>==gi')
K.n('<A-k>', ':m .-2<cr>==gi') --
-- neotree
K.n('<leader>f', '<cmd>Neotree toggle<cr>')
K.n('<leader>o', '<cmd>Neotree focus<cr>') --
-- packer
K.n('<Leader>pc', ':PackerCompile')
K.n('<Leader>pi', ':PackerInstall')
K.n('<Leader>ps', ':PackerSync')
K.n('<Leader>pu', ':PackerUpdate') --
-- standard operations
K.n('<Leader>w', '<cmd>w<cr>')
K.n('<Leader>q', '<cmd>q<cr>')
K.n('<Leader>c', '<cmd>bdelete!<cr>')
K.n('<Leader>h', '<cmd>nohlsearch<cr>') --
-- telescope
K.n('<leader>fb', '<cmd>Telescope buffers<cr>')
K.n('<leader>ff', '<cmd>Telescope find_files<cr>')
K.n('<leader>fh', '<cmd>Telescope help_tags<cr>')
K.n('<leader>fo', '<cmd>Telescope oldfiles<cr>')
K.n('<leader>fw', '<cmd>Telescope live_grep<cr>')
K.n('<leader>gb', '<cmd>Telescope git_branches<cr>')
K.n('<leader>gc', '<cmd>Telescope git_commits<cr>')
K.n('<leader>ld', '<cmd>Telescope diagnostics<cr>')
K.n('<leader>lr', '<cmd>Telescope lsp_references<cr>')
K.n('<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>')
K.n('<leader>sc', '<cmd>Telescope commands<cr>')
K.n('<leader>sk', '<cmd>Telescope keymaps<cr>')
K.n('<leader>sm', '<cmd>Telescope man_pages<cr>')
K.n('<leader>sn', '<cmd>Telescope notifications<cr>')
K.n('<leader>sr', '<cmd>Telescope registers<cr>') --
K.n('<leader>tfd', '<cmd>Telescope terraform_doc modules<cr>')
K.n('<leader>p', '<cmd>Telescope project<CR>')

-- terminal
K.n('<C-\\>', '<cmd>ToggleTerm<cr>')
K.n('<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
K.n('<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
K.n('<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>') --
-- window navigation
K.n('<C-h>', '<c-w>h')
K.n('<C-j>', '<c-w>j')
K.n('<C-k>', '<c-w>k')
K.n('<C-l>', '<c-w>l') --
-- window resizing
K.n('<C-down>', ':resize +2<cr>')
K.n('<C-left>', ':vertical resize -2<cr>')
K.n('<C-right>', ':vertical resize +2<cr>')
K.n('<C-up>', ':resize -2<cr>') --
-- ╭────────────────╮
-- │ TERMINAL ⮕ 't' │
-- ╰────────────────╯
-- navigation
K.t('<C-h>', '<C-\\><C-N><C-w>h')
K.t('<C-j>', '<C-\\><C-N><C-w>j')
K.t('<C-k>', '<C-\\><C-N><C-w>k')
K.t('<C-l>', '<C-\\><C-N><C-w>l') --
-- toggle terminal
K.t('<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
K.t('<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
K.t('<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>') --
-- ╭──────────────╮
-- │ VISUAL ⮕ 'v' │
-- ╰──────────────╯
-- move text up and down
K.v('<A-j>', ':m .+1<CR>==')
K.v('<A-k>', ':m .-2<CR>==')
K.v('p', '"_dP') --
-- persistent indent mode
K.v('<', '<gv')
K.v('>', '>gv') --
-- sort
K.v('<C-s>', ':Sort<CR>') --
-- comment-box
K.v('<leader>bc', [[<Cmd>lua require('comment-box').accbox()<CR>]])
-- ╭────────────────────╮
-- │ VISUAL BLOCK ⮕ 'x' │
-- ╰────────────────────╯
-- move text up and down
K.x('<A-j>', ':move \'>+1<CR>gv-gv')
K.x('<A-k>', ':move \'<-2<CR>gv-gv')
K.x('J', ':move \'>+1<CR>gv-gv')
K.x('K', ':move \'<-2<CR>gv-gv') --

-- vim:ft=lua:sw=4:sts=4:et:
