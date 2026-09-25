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
      local ts = require('nvim-treesitter')
      local installed = ts.get_installed('parsers')
      local missing = vim.tbl_filter(function(lang) return not vim.list_contains(installed, lang) end, ensure_installed)
      if #missing > 0 then ts.install(missing) end

      -- Attach to every filetype whose parser loads, so parsers beyond `ensure_installed` work too.
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        pattern = '*',
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(ev.match)
          if not lang then return end
          -- `add` returns nil for a missing parser and throws for a broken one (ABI mismatch).
          local ok, loaded = pcall(vim.treesitter.language.add, lang)
          if not (ok and loaded) then return end
          vim.treesitter.start(ev.buf, lang)
          -- Without an `indents` query, the treesitter indentexpr gives indent 0 on every line.
          if #vim.treesitter.query.get_files(lang, 'indents') > 0 then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
-- vim: ft=lua ts=2 sts=2 sw=2 et
