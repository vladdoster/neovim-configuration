local o = vim.o

o.shadafile = "NONE"
local present_0, impatient = pcall(require, "impatient")
if present_0 then
    impatient.enable_profile()
end
require("core")
o.shadafile = ""
