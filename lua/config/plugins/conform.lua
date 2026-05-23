return {
  spec = { src = 'https://github.com/stevearc/conform.nvim', name = 'conform.nvim' },
  lazy = {
    cmd = { 'ConformInfo' },
    keys = {
      { '<leader>f', mode = '', desc = '[F]ormat buffer' },
    },
  },
  setup = function()
    require('conform').setup({
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return { timeout_ms = 500, lsp_format = 'fallback' }
        end
      end,
      formatters_by_ft = { lua = { 'stylua' } },
    })
    vim.keymap.set(
      '',
      '<leader>f',
      function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
      { desc = '[F]ormat buffer' }
    )
  end,
}
-- vim: ts=2 sts=2 sw=2 et
