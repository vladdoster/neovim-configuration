local status_ok, jsonls_settings = pcall(require, 'nlspsettings.jsonls')
if status_ok then
  default_schemas = jsonls_settings.get_default_schemas()
else
  default_schemas = nil
end
local opts = {
  settings = {json = {schemas = default_schemas}},
  setup = {
    commands = {
      Format = {
        function() vim.lsp.buf.range_formatting({}, {0, 0}, {
          vim.fn.line('$'),
          0
        }) end
      }
    }
  }
}

return opts
