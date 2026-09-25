-- Python document symbols: basedpyright never lists imports, so treesitter adds them.
local M = {}

local import_query = [[
  (import_statement name: [(dotted_name) @import (aliased_import alias: (identifier) @import)])
  (import_from_statement name: [(dotted_name) @import (aliased_import alias: (identifier) @import)])
]]

local function import_items(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, 'python', { error = false })
  if not parser then return {} end
  local query = vim.treesitter.query.parse('python', import_query)
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local items = {}
  for _, node in query:iter_captures(parser:parse()[1]:root(), bufnr) do
    local row, col = node:start()
    table.insert(items, {
      filename = filename,
      lnum = row + 1,
      col = col + 1,
      kind = 'Import',
      text = '[Import] ' .. vim.treesitter.get_node_text(node, bufnr),
    })
  end
  return items
end

function M.document_symbols()
  local bufnr = vim.api.nvim_get_current_buf()
  local params = { textDocument = vim.lsp.util.make_text_document_params(bufnr) }
  vim.lsp.buf_request_all(bufnr, 'textDocument/documentSymbol', params, function(results)
    local items = import_items(bufnr)
    for client_id, res in pairs(results) do
      local client = vim.lsp.get_client_by_id(client_id)
      if client and res.result then
        vim.list_extend(items, vim.lsp.util.symbols_to_items(res.result, bufnr, client.offset_encoding))
      end
    end
    table.sort(items, function(a, b) return a.lnum < b.lnum or (a.lnum == b.lnum and a.col < b.col) end)

    local conf = require('telescope.config').values
    local opts = { bufnr = bufnr, path_display = { 'hidden' } }
    require('telescope.pickers')
      .new(opts, {
        prompt_title = 'LSP Document Symbols',
        finder = require('telescope.finders').new_table({
          results = items,
          entry_maker = require('telescope.make_entry').gen_from_lsp_symbols(opts),
        }),
        previewer = conf.qflist_previewer(opts),
        sorter = conf.prefilter_sorter({ tag = 'symbol_type', sorter = conf.generic_sorter(opts) }),
        push_cursor_on_edit = true,
        push_tagstack_on_edit = true,
      })
      :find()
  end)
end

return M
