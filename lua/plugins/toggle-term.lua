require("toggleterm").setup{
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping    = [[<C-t>]],
  hide_numbers    = true,        -- hide    the number   column in   toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,        -- whether or  not      the    open mapping    applies in insert mode
  persist_size    = true,
  direction       = 'vertical',
  close_on_exit   = true,        -- close   the terminal window when the        process exits
  shell           = vim.o.shell, -- change  the default  shell
}
