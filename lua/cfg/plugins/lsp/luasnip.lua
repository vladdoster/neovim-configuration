local types = require('luasnip.util.types')
require('luasnip').setup({
  ext_opts={
    [types.choiceNode]={active={virt_text={{'●', 'DiffAdd'}}}},
    [types.insertNode]={active={virt_text={{'●', 'DiffDelete'}}}}
  }
})
-- loading any vscode snippets from plugins
require('luasnip.loaders.from_vscode').lazy_load()
-- mappings to move around inside snippets
vim.keymap.set({'i', 's'}, '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
vim.keymap.set({'i', 's'}, '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
