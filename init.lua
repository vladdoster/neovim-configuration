function P(...)
  local args = {n=select('#', ...), ...}
  for i = 1, args.n do args[i] = vim.inspect(args[i]) end
  print(table.unpack(args))
end
local impatient_ok, impatient = pcall(require, 'impatient')
if impatient_ok then impatient.enable_profile() end

vim.o.termguicolors = true
require 'plugins'
