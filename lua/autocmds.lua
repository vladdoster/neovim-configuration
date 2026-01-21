require('helpers/globals')

-- augroup('YankHighlight', { clear = true })
-- autocmd('TextYankPost', {
--   group = 'YankHighlight',
--   callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' }) end,
-- })
--
-- augroup('qClosesBuffer', { clear = true })
-- autocmd('Filetype', {
--   group = 'qClosesBuffer',
--   pattern = { 'PlenaryTestPopup', 'help', 'lspinfo', 'man', 'qf', 'startuptime' },
--   callback = function(event)
--     bo[event.buf].buflisted = false
--     keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('BufEnter', { pattern = '', command = ':checktime' })
--
-- autocmd('BufEnter', {
--   desc = 'Open Neo-Tree on startup with directory',
--   group = augroup('neotree_start', { clear = true }),
--   callback = function()
--     local neotree_loaded, _ = pcall(require, 'neo-tree')
--     if not neotree_loaded then
--       api.nvim_del_augroup_by_name('neotree_start')
--     else
--       local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0)) -- TODO: REMOVE vim.loop WHEN DROPPING SUPPORT FOR Neovim v0.9
--       if stats and stats.type == 'directory' then
--         api.nvim_del_augroup_by_name('neotree_start')
--         require('neo-tree')
--       end
--     end
--   end,
-- })
--
api.nvim_create_user_command('TrimWhitespace', function()
  cmd(':%s/\\s\\+$//e')
  print('Trimmed whitespace')
end, { nargs = 0 })

-- {{{ Add modeline on save
-- autocmd('BufWritePre', {
--   pattern = '*',
--   command = ':lua insertModeline()'
-- })
-- }}}

--  vim: set expandtab filetype=lua shiftwidth=4 tabstop=4 :
