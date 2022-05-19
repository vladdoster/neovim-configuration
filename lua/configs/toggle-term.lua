local M = {}
local toggleterm_ok, toggleterm = pcall(require, 'toggleterm')
if not toggleterm_ok then return end
toggleterm.setup({
  close_on_exit=true,
  direction='float',
  float_opts={border='curved', winblend=0, highlights={border='Normal', background='Normal'}},
  hide_numbers=true,
  insert_mappings=true,
  on_open=function(term)
    vim.cmd 'startinsert!'
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', {noremap=true, silent=true})
  end,
  open_mapping=[[<c-\>]],
  persist_size=true,
  shade_filetypes={},
  shade_terminals=true,
  shading_factor=2,
  shell=vim.o.shell,
  size=10,
  start_in_insert=true
})
return
