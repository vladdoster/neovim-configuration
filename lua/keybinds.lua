-- Keymap method
local K = setmetatable({
  nore={noremap=true, silent=true, expr=false},
  remap={noremap=false, silent=true, expr=false}
}, {
  __index=function(p, mode)
    return setmetatable({
      map=function(key, action) vim.api.nvim_set_keymap(mode, key, action, p.remap) end,
      nmap=function(key, action) vim.api.nvim_set_keymap(mode, key, action, p.nore) end,
      bmap=function(buf, key, action) vim.api.nvim_buf_set_keymap(buf, mode, key, action, p.nore) end
    }, {__call=function(this, key, action) this.nmap(key, action) end})
  end
})
--
-- Remap space as leader key
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent=true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', {expr=true, silent=true})
vim.keymap.set('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', {expr=true, silent=true})
-- ╭──────────────╮
-- │ INSERT ⮕ 'i' │
-- ╰──────────────╯
-- quick normal mode
K.i('jk', '<ESC>')
-- ╭──────────────╮
-- │ NORMAL ⮕ 'n' │
-- ╰──────────────╯
--
-- buffer management
K.n('<leader>x', '<cmd>lua require("Buffers").only()<CR>')
K.n('<leader>X', '<cmd>lua require("Buffers").clear()<CR>')
K.n('<leader>q', '<cmd>lua require("Buffers").delete()<CR>')
-- buffer navigation
K.n('<S-l>', ':bnext<cr>')
K.n('<S-h>', ':bprevious<cr>')
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
K.n('<C-q>', '<cmd>q!<cr>')
-- force write
K.n('<C-s>', '<cmd>w!<cr>')
-- gitsigns
K.v('<leader><Enter>', '<Plug>(EasyAlign)')
K.n('<leader><Enter>', '<Plug>(EasyAlign)')
-- dial
-- K.n('<C-a>', [[<cmd>lua require("dial.map").inc_normal()<cr>]])
-- K.n('<C-x>', [[<cmd>lua require("dial.map").dec_normal()<cr>]])

-- K.v('<C-a>', [[<cmd>lua require('dial.map').inc_visual()<cr>]])
-- K.v('<C-x>', [[<cmd>lua require('dial.map').dec_visual()<cr>]])
-- K.v('g<C-a>', [[<cmd>lua require('dial.map').inc_gvisual()<cr>]])
-- K.v('g<C-x>', [[<cmd>lua require('dial.map').dec_gvisual()<cr>]])
K.n('<C-a>', [[<cmd>lua require('dial.map').inc_normal()<CR>]])
K.n('<C-x>', [[<cmd>lua require('dial.map').dec_normal()<CR>]])
-- vim.api.nvim_set_keymap('v', '<C-a>', require('dial.map').inc_visual(), { noremap = true })
-- vim.api.nvim_set_keymap('v', '<C-x>', require('dial.map').dec_visual(), { noremap = true })
-- vim.api.nvim_set_keymap('v', 'g<C-a>', require('dial.map').inc_gvisual(), { noremap = true })
-- vim.api.nvim_set_keymap('v', 'g<C-x>', require('dial.map').dec_gvisual(), { noremap = true })

-- move text up and down
K.n('<A-j>', ':m .+1<cr>==gi')
K.n('<A-k>', ':m .-2<cr>==gi')
-- neotree
K.n('<leader>f', '<cmd>Neotree toggle<cr>')
K.n('<leader>o', '<cmd>Neotree focus<cr>')
-- packer
K.n('<Leader>pc', ':PackerCompile')
K.n('<Leader>pi', ':PackerInstall')
K.n('<Leader>ps', ':PackerSync')
K.n('<Leader>pu', ':PackerUpdate')
-- standard operations
K.n('<Leader>w', '<cmd>w<cr>')
K.n('<Leader>q', '<cmd>q<cr>')
K.n('<Leader>c', '<cmd>bdelete!<cr>')
K.n('<Leader>h', '<cmd>nohlsearch<cr>')
-- +───────────+
-- │ telescope │
-- +───────────+
K.n('<leader>fb', '<cmd>Telescope buffers<cr>')
K.n('<leader>ff', '<cmd>Telescope find_files {previewer=false}<cr>')
K.n('<leader>fh', '<cmd>Telescope help_tags<cr>')
K.n('<leader>fo', '<cmd>Telescope oldfiles<cr>')
K.n('<leader>fw', '<cmd>Telescope live_grep<cr>')

K.n('<leader>gb', '<cmd>Telescope git_branches<cr>')
K.n('<leader>gc', '<cmd>Telescope git_commits<cr>')

K.n('<leader>ld', '<cmd>Telescope diagnostics<cr>')
K.n('<leader>lr', '<cmd>Telescope lsp_references<cr>')
K.n('<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>')

K.n('<leader>p', '<cmd>Telescope project<CR>')

K.n('<leader>sc', '<cmd>Telescope commands<cr>')
K.n('<leader>sk', '<cmd>Telescope keymaps<cr>')
K.n('<leader>sm', '<cmd>Telescope man_pages<cr>')
K.n('<leader>sn', '<cmd>Telescope notifications<cr>')
K.n('<leader>sr', '<cmd>Telescope registers<cr>')

K.n('<leader>tfd', '<cmd>Telescope terraform_doc modules<cr>')
-- +──────────+
-- │ terminal │
-- +──────────+
K.n('<C-\\>', '<cmd>ToggleTerm<cr>')
K.n('<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
K.n('<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
K.n('<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>')
-- window navigation
K.n('<C-h>', '<c-w>h')
K.n('<C-j>', '<c-w>j')
K.n('<C-k>', '<c-w>k')
K.n('<C-l>', '<c-w>l')
-- window resizing
K.n('<C-down>', ':resize +2<cr>')
K.n('<C-left>', ':vertical resize -2<cr>')
K.n('<C-right>', ':vertical resize +2<cr>')
K.n('<C-up>', ':resize -2<cr>')
-- ╭────────────────╮
-- │ TERMINAL ⮕ 't' │
-- ╰────────────────╯
-- navigation
K.t('<C-h>', '<C-\\><C-N><C-w>h')
K.t('<C-j>', '<C-\\><C-N><C-w>j')
K.t('<C-k>', '<C-\\><C-N><C-w>k')
K.t('<C-l>', '<C-\\><C-N><C-w>l')
-- toggle terminal
K.t('<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
K.t('<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
K.t('<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>')
-- ╭──────────────╮
-- │ VISUAL ⮕ 'v' │
-- ╰──────────────╯
-- move text up and down
K.v('<A-j>', ':move .+1<CR>==')
K.v('<A-k>', ':move .-2<CR>==')
K.v('p', '"_dP') --
-- persistent indent mode
K.v('<', '<gv')
K.v('>', '>gv') --
-- sort
K.v('<C-s>', ':Sort<CR>')
-- comment-box
K.v('<leader>bc', [[<Cmd>lua require('comment-box').accbox()<CR>]])
-- ╭────────────────────╮
-- │ VISUAL BLOCK ⮕ 'x' │
-- ╰────────────────────╯
-- move text up and down
K.x('<A-j>', ':move \'>+1<CR>gv-gv')
K.x('<A-k>', ':move \'<-2<CR>gv-gv')
K.x('J', ':move \'>+1<CR>gv-gv')
K.x('K', ':move \'<-2<CR>gv-gv')

-- vim:ft=lua:sw=4:sts=4:et:
