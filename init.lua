local status_ok, impatient = pcall(require, 'impatient')
if status_ok then impatient.enable_profile() end

for _, source in ipairs {'settings', 'plugins', 'keybinds', 'autocmd'} do
  local found, fault = pcall(require, source)
  if not found then vim.api.nvim_err_writeln('Failed to load ' .. source .. '\n\n' .. fault) end
end
