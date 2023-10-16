require"helpers/globals"

-- augroup('YankHighlight', {clear=true})
-- autocmd('TextYankPost', {
--   group='YankHighlight',
--   callback=function()
--     vim.highlight.on_yank({higroup='IncSearch', timeout='1000'})
--   end
-- })
--
-- autocmd('BufWritePre', {pattern='', command=':%s/\\s\\+$//e'})
-- autocmd('BufEnter', {pattern='', command='set fo-=c fo-=r fo-=o'})

augroup('qClosesBuffer', {clear=true})
autocmd('Filetype', {
  group='qClosesBuffer',
  pattern={'PlenaryTestPopup', 'help', 'lspinfo', 'man', 'qf', 'startuptime'},
  callback=function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', {buffer=event.buf, silent=true})
  end
})
