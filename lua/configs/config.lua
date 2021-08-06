local M = {}

local cmd = vim.cmd
local g = vim.g

function M.lspkind()
    local present, lspkind = pcall(require, "lspkind")
    if present then lspkind.init() end
end

return M
