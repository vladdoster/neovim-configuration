-- Keymap method {{{
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
-- }}}
-- Leader {{{
local map = vim.api.nvim_set_keymap
map('', '<Space>', '<Nop>', {noremap=true, silent=true})
vim.g.mapleader = ' '
-- }}}

-- [[ COMMAND  ⮕ 'c' ]] {{{

-- }}}
-- [[ INSERT   ⮕ 'i' ]]
-- quick normal mode{{{
K.i('jk', '<ESC>') -- }}}
-- [[ NORMAL   ⮕ 'n' ]]
-- buffer management {{{
K.n('<leader>x', '<cmd>lua require("Buffers").only()<CR>')
K.n('<leader>X', '<cmd>lua require("Buffers").clear()<CR>')
K.n('<leader>q', '<cmd>lua require("Buffers").delete()<CR>') -- }}}
-- buffer navigation  {{{
K.n('<S-l>', ':bnext<cr>')
K.n('<S-h>', ':bprevious<cr>') -- }}}
-- comment {{{
K.n('<leader>/', '<cmd>lua require(\'comment.api\').toggle_current_linewise()<cr>')
K.n('<leader>/', '<esc><cmd>lua require(\'comment.api\').toggle_linewise_op(vim.fn.visualmode())<cr>') -- }}}
-- disable ex mode {{{
K.n('n', 'q', '<nop>') -- }}}
-- edit configurations {{{
K.n('<leader>df', '<cmd>lua require "utils".openDirectory("~/.config/dotfiles")<cr>')
K.n('<leader>vd', '<cmd>lua require "utils".openDirectory("~/.config/nvim")<cr>')
K.n('<leader>zd', '<cmd>lua require "utils".openDirectory("~/.config/zsh")<cr>')
K.n('<leader>cd', '<cmd>lua require "utils".openDirectory("~/code")<cr>') -- }}}
-- force quit {{{
K.n('<C-q>', '<cmd>q!<cr>') -- }}}
-- force write {{{
K.n('<C-s>', '<cmd>w!<cr>') -- }}}
-- gitsigns {{{
K.n('<leader>gd', '<cmd>gitsigns diffthis head<cr>')
K.n('<leader>gh', '<cmd>lua require "gitsigns".reset_hunk()<cr>')
K.n('<leader>gj', '<cmd>lua require "gitsigns".next_hunk()<cr>')
K.n('<leader>gk', '<cmd>lua require "gitsigns".prev_hunk()<cr>')
K.n('<leader>gl', '<cmd>lua require "gitsigns".blame_line()<cr>')
K.n('<leader>gp', '<cmd>lua require "gitsigns".preview_hunk()<cr>')
K.n('<leader>gr', '<cmd>lua require "gitsigns".reset_buffer()<cr>')
K.n('<leader>gs', '<cmd>lua require "gitsigns".stage_hunk()<cr>')
K.n('<leader>gu', '<cmd>lua require "gitsigns".undo_stage_hunk()<cr>') -- }}}
-- lsp {{{
K.n('<leader>[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
K.n('<leader>]d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
K.n('<leader>gd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
K.n('<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
K.n('<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
K.n('<leader>gj', '<cmd>lua vim.diagnostic.goto_next()<cr>')
K.n('<leader>gk', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
K.n('<leader>gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
K.n('<leader>go', '<cmd>lua vim.diagnostic.open_float()<cr>')
K.n('<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')
K.n('<leader>k', '<cmd>lua vim.lsp.buf.hover()<cr>')
K.n('<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
K.n('<leader>ld', '<cmd>lua vim.diagnostic.open_float()<cr>')
K.n('<leader>lf', '<cmd>lua vim.lsp.buf.formatting_sync()<cr>')
K.n('<leader>li', '<cmd>lspinfo<cr>')
K.n('<leader>li', '<cmd>lspinstallinfo<cr>')
K.n('<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')
K.n('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>') -- }}}
-- move text up and down {{{
K.n('<A-j>', ':m .+1<cr>==gi')
K.n('<A-k>', ':m .-2<cr>==gi') -- }}}
-- neotree {{{
K.n('<C-n>', '<cmd>Neotree toggle<cr>')
K.n('<leader>o', '<cmd>Neotree focus<cr>') -- }}}
-- packer {{{
K.n('<leader>pc', '<cmd>packercompile<cr>')
K.n('<leader>pi', '<cmd>packerinstall<cr>')
K.n('<leader>ps', '<cmd>packersync<cr>')
K.n('<leader>ps', '<cmd>packerstatus<cr>')
K.n('<leader>pu', '<cmd>packerupdate<cr>') -- }}}
-- standard operations {{{
K.n('<leader>w', '<cmd>w<cr>')
K.n('<leader>q', '<cmd>q<cr>')
K.n('<leader>c', '<cmd>bdelete!<cr>')
K.n('<leader>h', '<cmd>nohlsearch<cr>') -- }}}
-- symbol outline {{{
K.n('<leader>ls', '<cmd>symbolsoutline<cr>') -- }}}
-- telescope {{{
K.n('<leader>fb', '<cmd>Telescope buffers<cr>')
K.n('<leader>ff', '<cmd>Telescope find_files<cr>')
K.n('<leader>fh', '<cmd>Telescope help_tags<cr>')
K.n('<leader>fo', '<cmd>Telescope oldfiles<cr>')
K.n('<leader>fw', '<cmd>Telescope live_grep<cr>')
K.n('<leader>gb', '<cmd>Telescope git_branches<cr>')
K.n('<leader>gc', '<cmd>Telescope git_commits<cr>')
K.n('<leader>gt', '<cmd>Telescope git_status<cr>')
K.n('<leader>ld', '<cmd>Telescope diagnostics<cr>')
K.n('<leader>lr', '<cmd>Telescope lsp_references<cr>')
K.n('<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>')
K.n('<leader>sb', '<cmd>Telescope git_branches<cr>')
K.n('<leader>sc', '<cmd>Telescope commands<cr>')
K.n('<leader>sh', '<cmd>Telescope help_tags<cr>')
K.n('<leader>sk', '<cmd>Telescope keymaps<cr>')
K.n('<leader>sm', '<cmd>Telescope man_pages<cr>')
K.n('<leader>sn', '<cmd>Telescope notifications<cr>')
K.n('<leader>sr', '<cmd>Telescope registers<cr>') -- }}}
-- terminal {{{
K.n('<C-\\>', '<cmd>ToggleTerm<cr>')
K.n('<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
K.n('<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
K.n('<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>') -- }}}
-- window navigation {{{
K.n('<C-h>', '<c-w>h')
K.n('<C-j>', '<c-w>j')
K.n('<C-k>', '<c-w>k')
K.n('<C-l>', '<c-w>l') -- }}}
-- window resizing {{{
K.n('<C-down>', ':resize +2<cr>')
K.n('<C-left>', ':vertical resize -2<cr>')
K.n('<C-right>', ':vertical resize +2<cr>')
K.n('<C-up>', ':resize -2<cr>') -- }}}
-- [[ TERMINAL ⮕ 't']]
-- navigation{{{
K.t('<C-h>', '<C-\\><C-N><C-w>h')
K.t('<C-j>', '<C-\\><C-N><C-w>j')
K.t('<C-k>', '<C-\\><C-N><C-w>k')
K.t('<C-l>', '<C-\\><C-N><C-w>l') -- }}}
-- toggle terminal{{{
K.t('<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
K.t('<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
K.t('<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>') -- }}}
-- [[ VISUAL   ⮕ 'v' ]]
-- move text up and down{{{
K.v('<A-j>', ':m .+1<CR>==')
K.v('<A-k>', ':m .-2<CR>==')
K.v('p', '"_dP') -- }}}
-- persistent indent mode{{{
K.v('<', '<gv')
K.v('>', '>gv') -- }}}
-- sort{{{
K.v('<C-s>', ':Sort<CR>') -- }}}
-- [[ VISUAL BLOCK ⮕ 'x' ]]
-- move text up and down{{{
K.x('<A-j>', ':move \'>+1<CR>gv-gv')
K.x('<A-k>', ':move \'<-2<CR>gv-gv')
K.x('J', ':move \'>+1<CR>gv-gv')
K.x('K', ':move \'<-2<CR>gv-gv') -- }}}

-- vim:ft=lua:sw=4:sts=4:et:foldmarker={{{,}}}:foldmethod=marker
