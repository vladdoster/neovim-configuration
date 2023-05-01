local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, {clear=true})
end

-- Check if we need to reload the file when it changed
vim.api
  .nvim_create_autocmd({'FocusGained', 'TermClose', 'TermLeave'}, {group=augroup('checktime'), command='checktime'})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group=augroup('highlight_yank'),
  callback=function()
    vim.highlight.on_yank()
  end
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({'VimResized'}, {
  group=augroup('resize_splits'),
  callback=function()
    vim.cmd('tabdo wincmd =')
  end
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group=augroup('close_with_q'),
  pattern={'PlenaryTestPopup', 'help', 'lspinfo', 'man', 'qf', 'spectre_panel', 'startuptime'},
  callback=function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', {buffer=event.buf, silent=true})
  end
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  group=augroup('wrap_spell'),
  pattern={'gitcommit', 'markdown'},
  callback=function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  group=augroup('auto_create_dir'),
  callback=function(event)
    if event.match:match('^%w%w+://') then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end
})

-- Remove useless stuff from the terminal window and enter INSERT mode
-- vim.api.nvim_create_autocmd('TermOpen', {
--   group=augroup('term_open'),
--   callback=function(data)
--     if not string.find(vim.bo[data.buf].filetype, '^[fF][tT]erm') then
--       A.nvim_set_option_value('number', false, {scope='local'})
--       A.nvim_set_option_value('relativenumber', false, {scope='local'})
--       A.nvim_set_option_value('signcolumn', 'no', {scope='local'})
--       A.nvim_command('startinsert')
--     end
--   end
-- })

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
