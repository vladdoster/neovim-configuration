local check_version = function()
  local verstr = tostring(vim.version())
  if vim.version.ge(vim.version(), '0.12') then
    vim.health.ok(string.format("Neovim version is: '%s'", verstr))
  else
    vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to 0.12 or later", verstr))
  end
end

local check_external_reqs = function()
  -- nvim-treesitter needs `curl`, `tar`, `tree-sitter` and `cc` to build parsers.
  for _, exe in ipairs({ 'git', 'make', 'unzip', 'rg', 'curl', 'tar', 'tree-sitter', 'cc' }) do
    local is_executable = vim.fn.executable(exe) == 1
    if is_executable then
      vim.health.ok(string.format("Found executable: '%s'", exe))
    else
      vim.health.warn(string.format("Could not find executable: '%s'", exe))
    end
  end
end

return {
  check = function()
    vim.health.start('config.nvim')

    vim.health.info([[NOTE: Not every warning is a 'must-fix' in `:checkhealth`

  Fix only warnings for plugins and languages you intend to use.
    Mason will give warnings for languages that are not installed.
    You do not need to install, unless you want to use those languages!]])

    vim.health.info('System Information: ' .. vim.inspect(vim.uv.os_uname()))

    check_version()
    check_external_reqs()
  end,
}
