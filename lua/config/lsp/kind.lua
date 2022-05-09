local M = {}

function M.cmp_format()
  return function(_entry, vim_item)
    return vim_item
  end
end

function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = kind
  end
end

return M
