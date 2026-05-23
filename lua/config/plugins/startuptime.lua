return {
  spec = { src = 'https://github.com/dstein64/vim-startuptime', name = 'vim-startuptime' },
  lazy = { cmd = { 'StartupTime' } },
  setup = function() vim.g.startuptime_tries = 50 end,
}
