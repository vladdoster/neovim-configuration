local autocmd = vim.api.nvim_create_autocmd
autocmd('BufEnter', { pattern = '*', command = 'set fo-=c fo-=r fo-=o' })
autocmd('FileType', { pattern = 'gitcommit,markdown', command = 'setlocal spell' })
autocmd('FileType', { pattern = 'gitcommit,markdown', command = 'setlocal wrap' })
autocmd('FileType', { pattern = 'help,lspinfo,man,qf,startuptime', command = 'nnoremap <buffer><silent> q :close<CR>' })
autocmd('FileType', { pattern = 'qf', callback = function() vim.opt_local.buflisted = false end })
autocmd('InsertEnter', { pattern = '*', command = 'set relativenumber' })
autocmd('InsertLeave,WinEnter', { pattern = '*', command = 'set cursorline' })
autocmd('TextYankPost', { callback = function() vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 }) end })
