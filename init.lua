function P(...)
  local args = {n=select('#', ...), ...}
  for i = 1, args.n do args[i] = vim.inspect(args[i]) end
  print(table.unpack(args))
end

if pcall(require, 'impatient') then
  require'impatient'.enable_profile()
else
  print '--- failed to load impatient'
end

vim.o.termguicolors = true
require 'plugins'
