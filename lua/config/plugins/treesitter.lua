return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      local ensure_installed = {
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
      }
      require('nvim-treesitter').install(ensure_installed)

      -- The autocmd matches *filetypes*, which are not the same as parser names
      -- (`bash` parser -> `sh` filetype, `vimdoc` -> `help`/`checkhealth`, ...).
      -- Ask Neovim for the mapping instead of hand-maintaining a second list that
      -- silently drifts whenever `ensure_installed` changes.
      local filetypes = {}
      for _, lang in ipairs(ensure_installed) do
        vim.list_extend(filetypes, vim.treesitter.language.get_filetypes(lang))
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        pattern = filetypes,
        callback = function(ev)
          vim.treesitter.start(ev.buf)
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
-- vim: ft=lua ts=2 sts=2 sw=2 et
