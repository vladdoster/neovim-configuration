local M = {}

vim.g.symbols_outline = {
  auto_close=false,
  auto_preview=true,
  highlight_hovered_item=true,
  position='right',
  preview_bg_highlight='Pmenu',
  relative_width=true,
  show_guides=true,
  show_numbers=false,
  show_relative_numbers=false,
  show_symbol_details=true,
  width=17,
  keymaps={
    close={'<Esc>', 'q'},
    code_actions='a',
    focus_location='o',
    goto_location='<Cr>',
    hover_symbol='<C-space>',
    rename_symbol='r',
    toggle_preview='K'
  },
  lsp_blacklist={},
  symbol_blacklist={}
}
return M
