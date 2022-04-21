Describe('the neovim-configuration module', function()
  It('should be required as "incline"', function() Expect({require, 'incline'}).To.Evaluate() end)

  require 'settings'
  require 'plugins'
  require 'keybinds'
  require 'autocmd'
end)
