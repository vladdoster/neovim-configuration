return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
        mode = { 'n', 'x' },
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      format_on_save = function(bufnr)
        -- Do not format these filetypes on save. This includes compound filetypes such as markdown.pandoc.
        -- Use <leader>f to format them.
        local disable_filetypes = { c = true, cpp = true, lua = true, markdown = true, python = true }
        for _, ft in ipairs(vim.split(vim.bo[bufnr].filetype, '.', { plain = true })) do
          if disable_filetypes[ft] then return nil end
        end
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        markdown = { 'mdformat' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
