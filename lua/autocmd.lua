local M = {}

-- Don't auto commenting new lines
-- autocmd('BufEnter', {pattern='*', command='set fo-=c fo-=r fo-=o'})
-- autocmd('FileType', {pattern='gitcommit,markdown', command='setlocal spell'})
-- autocmd('FileType', {pattern='gitcommit,markdown', command='setlocal wrap'})
-- autocmd('FileType', {pattern='help,lspinfo,man,qf,startuptime', command='nnoremap <buffer><silent> q :close<CR>'})
-- autocmd('FileType', {pattern='qf', callback=function() vim.opt_local.buflisted = false end})
-- autocmd('InsertEnter', {pattern='*', command='set relativenumber'})
-- autocmd('InsertLeave,WinEnter', {pattern='*', command='set cursorline'})
-- autocmd('TextYankPost', {callback=function() vim.highlight.on_yank({higroup='Visual', timeout=120}) end})

M.autocmds = {
  {
    'TextYankPost',
    {
      group='_general_settings',
      pattern='*',
      desc='Highlight text on yank',
      callback=function() require('vim.highlight').on_yank {higroup='Search', timeout=200} end
    }
  },
  {'FileType', {group='_filetype_settings', pattern='qf', command='set nobuflisted'}},
  {'FileType', {group='_filetype_settings', pattern={'gitcommit', 'markdown'}, command='setlocal wrap spell'}},
  {
    'FileType',
    {
      group='_buffer_mappings',
      pattern={'qf', 'help', 'man', 'floaterm', 'lspinfo', 'lsp-installer', 'null-ls-info'},
      command='nnoremap <silent> <buffer> q :close<CR>'
    }
  },
  {
    {'BufWinEnter', 'BufRead', 'BufNewFile'},
    {group='_format_options', pattern='*', command='setlocal formatoptions-=c formatoptions-=r formatoptions-=o'}
  },
  {'VimResized', {group='_auto_resize', pattern='*', command='tabdo wincmd ='}}
}


function M.define_autocmds(definitions)
  for _, entry in ipairs(definitions) do
    local event = entry[1]
    local opts = entry[2]
    if type(opts.group) == 'string' and opts.group ~= '' then
      local exists, _ = pcall(vim.api.nvim_get_autocmds, {group=opts.group})
      if not exists then vim.api.nvim_create_augroup(opts.group, {}) end
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

M.define_autocmds(M.autocmds)

return M
