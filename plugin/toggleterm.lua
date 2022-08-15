local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then return end
toggleterm.setup({
  close_on_exit=true,
  direction='float',
  env={MANPAGER='less -X'},
  float_opts={border='curved', winblend=0, highlights={border='Normal', background='Normal'}},
  hide_numbers=true,
  highlights={CursorLineSign={link='DarkenedPanel'}, Normal={guibg='#14141A'}},
  insert_mappings=false,
  on_open=function(term)
    vim.cmd 'startinsert!'
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', {noremap=true, silent=true})
  end,
  open_mapping=[[<space>t]],
  persist_size=true,
  shade_filetypes={},
  shade_terminals=true,
  shading_factor=2,
  shell=vim.o.shell,
  size=10,
  start_in_insert=false,
  terminal_mappings=false
})
vim.cmd [[autocmd! ToggleTermCommands WinEnter]]
