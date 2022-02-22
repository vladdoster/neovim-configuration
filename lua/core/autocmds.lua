local M = {}
local cmd = vim.cmd

cmd[[au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

M.nvim_create_augroups = function(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.cmd(command)
    end
    vim.cmd('augroup END')
  end
end

cmd([[au FocusGained * :checktime]]) -- Check if we need to reload the file when it changed
cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]])
cmd([[autocmd FileType markdown setlocal spell]])

local autocmds = {
  ansi_esc_log = {{'BufEnter', '*.log', ':AnsiEsc'}},
  lua_hl = {
    {
      'TextYankPost',
      '*',
      [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]]
    }
  },
  python_file = {
    {
      'Filetype',
      'python',
      'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4'
    }
  },
  rel_num_off = {{'InsertLeave', '*', 'setlocal relativenumber'}},
  rel_num_on = {{'InsertEnter', '*', 'setlocal number'}},
  resize_windows_proportionally = {{'VimResized', '*', ':wincmd ='}},
  save_shada = {{'VimLeave', '*', 'wshada!'}},
  toggle_search_hl = {{'InsertEnter', '*', 'setlocal nohlsearch'}}
}
M.nvim_create_augroups(autocmds)
return M
