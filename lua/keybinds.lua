-- Keymap method
local K = setmetatable({nore={noremap=true, silent=true, expr=false}, remap={noremap=false, silent=true, expr=false}}, {
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
K.n('<leader>x"', ':bdelete<cr>')
K.n('<leader>q', '<cmd>lua require("Buffers").delete()<cr>')
K.n('<leader>X', '<cmd>lua require("Buffers").clear()<cr>')
-- buffer navigation
K.n('<S-l>', ':bnext<cr>')
K.n('<S-h>', ':bprevious<cr>')
-- disable ex mode
K.n('<Esc>', '<cmd> :noh <cr>')
K.n([[Q]], [[<Nop>]])
-- Disable command-line window
K.n([[q:]], [[<Nop>]])
K.n([[q/]], [[<Nop>]])
K.n([[q?]], [[<Nop>]])
-- Quickly enter substitution mode
K.n('<leader>/', ':%s/')
K.n('<leader>?', ':%S/')
K.v('<leader>/', ':s/')
K.v('<leader>?', ':S/')
-- edit configurations

-- comment-box
K.n('<leader>bc', [[<cmd>lua require('comment-box').accbox()<cr>]])
-- force quit
K.n('<C-q>', '<cmd>q!<cr>')
-- force write
K.n('<C-s>', '<cmd>w!<cr>')
-- gitsigns
K.v('<leader><Enter>', '<Plug>(EasyAlign)')
K.n('<leader><Enter>', '<Plug>(EasyAlign)')
-- dial
K.n('<C-a>', '<cmd>lua require("dial.map").inc_normal()<cr>')
K.n('<C-x>', '<cmd>lua require("dial.map").dec_normal()<cr>')
-- move text up and down
K.n('<A-j>', ':m .+1<cr>==gi')
K.n('<A-k>', ':m .-2<cr>==gi')
-- neotree
K.n('<leader>f', '<cmd>Neotree toggle<cr>')
K.n('<leader>o', '<cmd>Neotree focus<cr>')
-- packer
K.n('<leader>pc', ':PackerCompile<cr>')
K.n('<leader>pi', ':PackerInstall<cr>')
K.n('<leader>ps', ':PackerSync<cr>')
K.n('<leader>pu', ':PackerUpdate<cr>')
-- standard operations
K.n('<leader>w', '<cmd>w<cr>')
K.n('<leader>q', '<cmd>q<cr>')
K.n('<leader>c', '<cmd>bdelete!<cr>')
K.n('<leader>h', '<cmd>nohlsearch<cr>')
-- Toggle the aerial window with <leader>a
K.n('<leader>a', '<cmd>AerialToggle!<cr>', {})
K.n('{', '<cmd>AerialPrev<cr>')
K.n('}', '<cmd>AerialNext<cr>')
K.n('[[', '<cmd>AerialPrevUp<cr>')
K.n(']]', '<cmd>AerialNextUp<cr>')
-- +───────────+
-- │ telescope │
-- +───────────+
K.n('<leader>fb', ':Telescope file_browser<CR>')
K.n('<leader>ff', ':Telescope find_files {previewer=false}<CR>')
K.n('<leader>fh', ':Telescope help_tags<CR>')
K.n('<leader>fo', ':Telescope oldfiles<CR>')
K.n('<leader>fp', ':Telescope project<CR>')
K.n('<leader>fw', ':Telescope live_grep<CR>')

K.n('<leader>gb', ':Telescope git_branches<CR>')
K.n('<leader>gc', ':Telescope git_commits<CR>')

K.n('<leader>ld', ':Telescope diagnostics<CR>')
K.n('<leader>lr', ':Telescope lsp_references<CR>')
K.n('<leader>ls', ':Telescope lsp_document_symbols<CR>')

K.n('<leader>sc', ':Telescope commands<CR>')
K.n('<leader>sk', ':Telescope keymaps<CR>')
K.n('<leader>sm', ':Telescope man_pages<CR>')
K.n('<leader>sn', ':Telescope notifications<CR>')
K.n('<leader>sr', ':Telescope registers<CR>')
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
K.v('<A-j>', ':move .+1<cr>==')
K.v('<A-k>', ':move .-2<cr>==')
K.v('p', '"_dP') --
-- persistent indent mode
K.v('<', '<gv')
K.v('>', '>gv') --
-- sort
K.v('<C-s>', ':Sort<cr>')
-- comment-box
K.v('<leader>bc', [[<cmd>lua require('comment-box').accbox()<cr>]])
-- ╭────────────────────╮
-- │ VISUAL BLOCK ⮕ 'x' │
-- ╰────────────────────╯
-- move text up and down
K.x('<A-j>', ':move \'>+1<cr>gv-gv')
K.x('<A-k>', ':move \'<-2<cr>gv-gv')
K.x('J', ':move \'>+1<cr>gv-gv')
K.x('K', ':move \'<-2<cr>gv-gv')

-- vim:ft=lua:sw=2:sts=2:et:
