local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then return end
toggleterm.setup {
  insert_mappings=false,
  env={MANPAGER='less -X'},
  terminal_mappings=false,
  start_in_insert=false,
  open_mapping=[[<space>t]],
  highlights={CursorLineSign={link='DarkenedPanel'}, Normal={guibg='#14141A'}}
}
vim.cmd [[autocmd! ToggleTermCommands WinEnter]]
