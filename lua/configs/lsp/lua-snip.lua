-- Loading any vscode snippets from plugins
local luasnip_ok, lua_snip = pcall(require, 'luasnip')
if not luasnip_ok then return end

local types = require('luasnip.util.types')
lua_snip.config.setup({
  ext_opts={
    [types.choiceNode]={active={virt_text={{'●', 'DiffAdd'}}}},
    [types.insertNode]={active={virt_text={{'●', 'DiffDelete'}}}}
  }
})
-- Load snippets from plugins
local status_ok, loader = pcall(require, 'luasnip.loaders.from_vscode')
if not status_ok then return end
loader.lazy_load()
-- Keymaps to navigate within snippets
vim.keymap.set('i', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
vim.keymap.set('i', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
vim.keymap.set('s', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
vim.keymap.set('s', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
