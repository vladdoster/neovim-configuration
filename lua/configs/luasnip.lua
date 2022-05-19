local M = {}

local status_ok, loader = pcall(require, 'luasnip.loaders.from_vscode')
if not status_ok then return end
loader.lazy_load()

return M
