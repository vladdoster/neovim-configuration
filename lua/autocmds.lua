require"helpers/globals"

augroup('YankHighlight', {clear=true})
autocmd('TextYankPost', {
  group='YankHighlight',
  callback=function()
    vim.highlight.on_yank({higroup='IncSearch', timeout='1000'})
  end
})

augroup('qClosesBuffer', {clear=true})
autocmd('Filetype', {
  group='qClosesBuffer',
  pattern={'PlenaryTestPopup', 'help', 'lspinfo', 'man', 'qf', 'startuptime'},
  callback=function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', {buffer=event.buf, silent=true})
  end
})

vim.api.nvim_create_user_command('TrimWhitespace', function()
  vim.cmd":%s/\\s\\+$//e"
  print("Trimmed whitespace")
end, {nargs=0})
