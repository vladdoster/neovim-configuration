local o = vim.o

-- Disable shadafile
o.shadafile = "NONE"

local present_0, impatient = pcall(require, "impatient")
if present_0 then
    impatient.enable_profile()
end

-- local init_modules = {
--     "core",
-- }
require("core")

-- for _, module in ipairs(init_modules) do
--     local ok, err = pcall(require, "core")
--     if not ok then
--         error("Error loading " .. module .. "\n\n" .. err)
--     end
-- end

-- Enable shadafile
o.shadafile = ""
