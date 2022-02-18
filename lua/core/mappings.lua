local M = {}
-- Remap space as leader key
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
map('', '<Space>', '<Nop>', opts)
-- Load Packer commands
cmd'silent! command PackerClean lua require "plugins" require("packer").clean()'
cmd'silent! command PackerCompile lua require"plugins" require("packer").compile()'
cmd'silent! command PackerInstall lua require"plugins" require("packer").install()'
cmd'silent! command PackerStatus lua require "plugins" require("packer").status()'
cmd'silent! command PackerSync lua require "plugins" require("packer").sync()'
cmd'silent! command PackerUpdate lua require "plugins" require("packer").update()'

local generic_opts_any = {noremap = true, silent = true}
local generic_opts = {
  insert_mode = generic_opts_any,
  normal_mode = generic_opts_any,
  visual_mode = generic_opts_any,
  visual_block_mode = generic_opts_any,
  command_mode = generic_opts_any,
  term_mode = {silent = true}
}
local mode_adapters = {
  command_mode = 'c',
  insert_mode = 'i',
  normal_mode = 'n',
  term_mode = 't',
  visual_block_mode = 'x',
  visual_mode = 'v'
}
local defaults = {
  insert_mode = {['jj'] = '<ESC>', ['jk'] = '<ESC>', ['kj'] = '<ESC>'},
  ---@usage change or add keymappings for normal mode
  normal_mode = {
    ['<A-Down>'] = ':resize +4<CR>',
    ['<A-Left>'] = ':vertical resize +4<CR>',
    ['<A-Right>'] = ':vertical resize -2<CR>',
    ['<A-Up>'] = ':resize -4<CR>',
    ['<A-j>'] = ':m .+1<CR>==',
    ['<leader>fm'] = ':FormatWrite<CR>',
    ['<A-k>'] = ':m .-2<CR>==',
    ['<C-Q>'] = ':q!',
    ['<C-h>'] = '<C-w>h',
    ['<C-j>'] = '<C-w>j',
    ['<C-k>'] = '<C-w>k',
    ['<C-l>'] = '<C-w>l',
    ['<C-s>'] = ':Sort <CR>',
    ['<Esc>'] = ':noh <CR>',
    ['<Leader>bn'] = ':bufdo bnext<CR>',
    ['<Leader>bp'] = ':bufdo bprevious<CR>',
    ['<Leader>ps'] = ':PackerSync<CR>',
    ['<Leader>st'] = ':StartupTime<CR>',
    ['<S-t>'] = ':enew <CR>',
    ['<S-w>'] = ':w <CR>',
    ['<leader>cm'] = ':Telescope git_commits <CR>',
    ['<leader>d'] = '<cmd>bdelete!<cr>',
    ['<leader>mw'] = ':!mdformat --wrap 80 %<CR>',
    ['<leader>tw'] = ':%s/\\s\\+$//e<CR>'
  },
  ---@usage change or add keymappings for terminal mode
  term_mode = { -- Terminal window navigation
    ['<C-h>'] = '<C-\\><C-N><C-w>h',
    ['<C-j>'] = '<C-\\><C-N><C-w>j',
    ['<C-k>'] = '<C-\\><C-N><C-w>k',
    ['<C-l>'] = '<C-\\><C-N><C-w>l'
  },
  visual_mode = {
    ['P'] = '"0P',
    ['p'] = '"0p',
    ['<'] = '<gv',
    ['<C-s>'] = ':sort<CR>',
    ['>'] = '>gv'
  },
  visual_block_mode = {
    ['<A-j>'] = ':m \'>+1<CR>gv-gv',
    ['<A-k>'] = ':m \'<-2<CR>gv-gv',
    ['J'] = ':move \'>+1<CR>gv-gv',
    ['K'] = ':move \'<-2<CR>gv-gv'
  },
  command_mode = {
    ['<C-j>'] = {
      'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
      {expr = true, noremap = true}
    },
    ['<C-k>'] = {
      'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
      {expr = true, noremap = true}
    }
  }
}
-- @usage Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val)
  local opt = generic_opts[mode] or generic_opts_any
  if type(val) == 'table' then opt, val = val[2], val[1] end
  if val then
    vim.api.nvim_set_keymap(mode, key, val, opt)
  else
    pcall(vim.api.nvim_del_keymap, mode, key)
  end
end
-- @usage Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps)
  mode = mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do M.set_keymaps(mode, k, v) end
end
-- @usage Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
for mode, mapping in pairs(defaults) do M.load_mode(mode, mapping) end

-- Navigate buffers
map('n', '<S-l>', '<cmd>bnext<CR>', opts)
map('n', '<S-h>', '<cmd>bprevious<CR>', opts)

-- Dashboard
map('n', '<leader>fn', '<cmd>DashboardNewFile<CR>', opts)
map('n', '<leader>db', '<cmd>Dashboard<CR>', opts)
map('n', '<leader>bm', '<cmd>DashboardJumpMarks<CR>', opts)
map('n', '<leader>sl', '<cmd>SessionLoad<CR>', opts)
map('n', '<leader>ss', '<cmd>SessionSave<CR>', opts)

-- Telescope
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
map('n', '<leader>fb', ':Telescope file_browser<CR>', opts)
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', opts)
map('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', opts)
map('n', '<leader>gt', '<cmd>Telescope git_status<CR>', opts)

-- Lspsaga
map('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
map('n', 'ca', '<cmd>Lspsaga code_action<CR>', opts)
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
map('n', 'rn', '<cmd>Lspsaga rename<CR>', opts)
map('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
map('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
map('n', '<C-u>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<cr>', opts)
map('n', '<C-d>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<cr>', opts)

-- Comment
map('n', '<leader>/', '<cmd>lua require(\'Comment.api\').toggle_current_linewise()<CR>', opts)
map('v', '<leader>/', '<esc><cmd>lua require(\'Comment.api\').toggle_linewise_op(vim.fn.visualmode())<CR>', opts)
-- Terminal
map('n', '<C-\\>', '<cmd>ToggleTerm<CR>', opts)

return M
