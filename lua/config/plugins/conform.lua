return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        markdown = { 'mdformat' },
      },
      formatters = {
        stylua = {
          prepend_args = {
            '--call-parentheses',
            'Input',
            '--collapse-simple-statement',
            'Always',
            '--column-width',
            '120',
            '--glob',
            '**/*.lua',
            '--indent-type',
            'Spaces',
            '--line-endings',
            'Unix',
            '--quote-style',
            'AutoPreferSingle',
            '--sort-requires',
          },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
