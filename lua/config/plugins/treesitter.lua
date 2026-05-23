return {
  spec = { src = 'https://github.com/nvim-treesitter/nvim-treesitter', name = 'nvim-treesitter' },
  setup = function()
    -- Match lazy.nvim's behavior: it auto-called require('nvim-treesitter').setup(opts).
    -- The v0.9 `master` branch exposes setup on `nvim-treesitter.configs`; v1
    -- (`main` branch) exposes it on `nvim-treesitter`. Try both.
    local opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = { 'ruby' } },
      indent = { enable = true, disable = { 'ruby' } },
    }
    local ok, configs = pcall(require, 'nvim-treesitter.configs')
    if ok and type(configs.setup) == 'function' then
      configs.setup(opts)
    else
      require('nvim-treesitter').setup(opts)
    end
  end,
  build = function() pcall(vim.cmd, 'TSUpdate') end,
}
-- vim: ts=2 sts=2 sw=2 et
