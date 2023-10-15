local gitsigns = require('gitsigns')

gitsigns.setup({
  signs={add={text='+'}, change={text='~'}, delete={text='_'}, topdelete={text='‾'}, changedelete={text='~'}},
  on_attach=function(bufnr)
    vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, {buffer=bufnr, desc='Preview git hunk'})
    local gs = package.loaded.gitsigns
    vim.keymap.set({'n', 'v'}, ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, {expr=true, buffer=bufnr, desc='Jump to next hunk'})
    vim.keymap.set({'n', 'v'}, '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, {expr=true, buffer=bufnr, desc='Jump to previous hunk'})
  end
})

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
