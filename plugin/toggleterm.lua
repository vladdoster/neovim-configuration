local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then return end
toggleterm.setup({
  auto_scroll=true,
  close_on_exit=true,
  direction='float',
  env={MANPAGER='less -X'},
  float_opts={border='curved', winblend=0, highlights={border='Normal', background='Normal'}},
  hide_numbers=true,
  highlights={CursorLineSign={link='DarkenedPanel'}, Normal={guibg='#14141A'}},
  insert_mappings=true,
  on_open=function(term)
    vim.cmd 'startinsert!'
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', {noremap=true, silent=true})
  end,
  persist_size=true,
  shade_filetypes={},
  shade_terminals=true,
  shading_factor=2,
  shell=vim.o.shell,
  size=24,
  start_in_insert=true,
  terminal_mappings=true
})
vim.cmd [[autocmd! ToggleTermCommands WinEnter]]
-- +──────────+
-- │ terminal │
-- +──────────+
local keymap = vim.keymap.set
local cmd = function(str) return string.format([[<cmd>%s<cr>]], str) end
keymap('n', '<C-\\>', cmd('ToggleTerm'))
keymap('n', '<leader>tf', cmd('ToggleTerm direction=float'))
keymap('n', '<leader>th', cmd('ToggleTerm size=10 direction=horizontal'))
keymap('n', '<leader>tv', cmd('ToggleTerm size=80 direction=vertical'))
function _G.set_terminal_keymaps()
  local opts = {buffer=0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm* set_terminal_keymaps()')
