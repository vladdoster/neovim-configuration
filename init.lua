vim.o.shadafile = 'NONE' -- Disable shadafile

local present_0, impatient = pcall(require, "impatient")
if present_0 then impatient.enable_profile() end

require "core.options"
require "core.autocmds"
require "core.mappings"
require("core.mappings").misc()

vim.o.shadafile = '' -- Re-enable shadafile
