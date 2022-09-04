local K = setmetatable({nore={noremap=true, silent=true, expr=false}, remap={noremap=false, silent=true, expr=false}}, {
  __index=function(p, mode)
    return setmetatable({
      map=function(key, action) vim.api.nvim_set_keymap(mode, key, action, p.remap) end,
      nmap=function(key, action) vim.api.nvim_set_keymap(mode, key, action, p.nore) end,
      bmap=function(buf, key, action) vim.api.nvim_buf_set_keymap(buf, mode, key, action, p.nore) end
    }, {__call=function(this, key, action) this.nmap(key, action) end})
  end
})
-- Remap space as leader key
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent=true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', {expr=true, silent=true})
-- vim.keymap.set('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', {expr=true, silent=true})
-- ╭──────────────╮
-- │ INSERT ⮕ 'i' │
-- ╰──────────────╯
-- quick normal mode
K.i('jk', '<ESC>')
-- ╭──────────────╮
-- │ NORMAL ⮕ 'n' │
-- ╰──────────────╯
-- neotree
K.n('<C-a>', '<cmd>Neotree reveal left<cr>')
K.n('<C-b>', '<cmd>Neotree toggle show buffers right<cr>')
K.n('<C-n>', '<cmd>Neotree toggle left<cr>')
-- aerial
K.n('<leader>s', '<cmd>AerialToggle<CR>')
-- buffer navigation
K.n('<C-w>e', '<cmd>tab split<cr>')
K.n('<C-x>', '<cmd>bd<cr>')
K.n('<S-h>', ':bprevious<cr>')
K.n('<S-l>', ':bnext<cr>')
-- disable ex mode
K.n('<Esc>', '<cmd> :noh <cr>')
K.n('Q', '<Nop>')
-- disable command-line window
K.n('q:', '<Nop>')
K.n('q/', '<Nop>')
K.n('q?', '<Nop>')
-- quickly enter substitution mode
K.n('<leader>/', ':%s/')
K.n('<leader>?', ':%S/')
K.v('<leader>/', ':s/')
K.v('<leader>?', ':S/')
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
K.n('<leader>p', '<cmd>Telescope project<cr>')
K.n('<leader>sc', '<cmd>Telescope commands<cr>')
K.n('<leader>sk', '<cmd>Telescope keymaps<cr>')
K.n('<leader>sm', '<cmd>Telescope man_pages<cr>')
K.n('<leader>sn', '<cmd>Telescope notifications<cr>')
K.n('<leader>sr', '<cmd>Telescope registers<cr>')
-- +──────────+
-- │ terminal │
-- +──────────+
K.n('<C-\\>', '<cmd>ToggleTerm<cr>')
K.n('<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
K.n('<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
K.n('<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>')
-- navigation
K.t('<C-h>', '<C-\\><C-N><C-w>h')
K.t('<C-j>', '<C-\\><C-N><C-w>j')
K.t('<C-k>', '<C-\\><C-N><C-w>k')
K.t('<C-l>', '<C-\\><C-N><C-w>l')
-- +─────────+
-- │ windows │
-- +─────────+
-- navigation
K.n('<C-h>', '<C-w>h')
K.n('<C-j>', '<C-w>j')
K.n('<C-k>', '<C-w>k')
K.n('<C-l>', '<C-w>l')
-- Resize with arrows
K.n('<C-Down>', ':resize -2<CR>')
K.n('<C-Left>', ':vertical resize -2<CR>')
K.n('<C-Right>', ':vertical resize +2<CR>')
K.n('<C-Up>', ':resize +2<CR>')

K.n('<S-down>', ':resize +2<cr>')
K.n('<S-left>', ':vertical resize -2<cr>')
K.n('<S-right>', ':vertical resize +2<cr>')
K.n('<S-up>', ':resize -2<cr>')
-- ╭──────────────╮
-- │ VISUAL ⮕ 'v' │
-- ╰──────────────╯
-- move text up and down
K.v('<A-j>', ':m .+1<CR>==')
K.v('<A-k>', ':m .-2<CR>==')
-- persistent indent mode
K.v('<', '<gv')
K.v('>', '>gv') --
-- sort
K.v('<C-s>', ':Sort<cr>')
K.v('p', '"_dP')
-- ╭────────────────────╮
-- │ VISUAL BLOCK ⮕ 'x' │
-- ╰────────────────────╯
-- move text up and down
K.x('J', ':move \'>+1<CR>gv-gv')
K.x('K', ':move \'<-2<CR>gv-gv')
K.x('<A-j>', ':move \'>+1<CR>gv-gv')
K.x('<A-k>', ':move \'<-2<CR>gv-gv')
