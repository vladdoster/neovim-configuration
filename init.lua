vim.o.shadafile = 'NONE'
require 'core'
vim.o.shadafile = ''

-- local plugins = require "lvim.plugins"
-- local commands = require "lvim.core.commands"

-- local init_path = debug.getinfo(1, "S").source:sub(2)
-- local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

-- if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  -- vim.opt.rtp:append(base_dir)
-- end

-- require("lvim.bootstrap"):init(base_dir)
-- require("lvim.config"):load()
-- require("lvim.plugin-loader").load { plugins, lvim.plugins }
-- commands.load(commands.defaults)
-- require("lvim.lsp").setup()
