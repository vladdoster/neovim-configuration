local M = {}

local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require 'vim.lsp.log'
  local api = vim.api
  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, 'No location found')
      return nil
    end
    if split_cmd then vim.cmd(split_cmd) end
    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])
      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command 'copen'
        api.nvim_command 'wincmd p'
      end
    else
      util.jump_to_location(result)
    end
  end
  return handler
end

function M.setup()
  local signs = {
    {name='DiagnosticSignError', text='E'},
    {name='DiagnosticSignWarn', text='W'},
    {name='DiagnosticSignHint', text='H'},
    {name='DiagnosticSignInfo', text='I'}
  }
  for _, sign in ipairs(signs) do vim.fn.sign_define(sign.name, {
    texthl=sign.name,
    text=sign.text,
    numhl=''
  }) end
  local config = {
    virtual_text=true,
    signs={active=signs},
    update_in_insert=true,
    underline=true,
    severity_sort=true,
    float={
      focusable=false,
      style='minimal',
      border='rounded',
      source='always',
      header='',
      prefix=''
    }
  }
  vim.diagnostic.config(config)
  vim.lsp.handlers['textDocument/definition'] = goto_definition 'split'
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {border='rounded'})
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border='rounded'
  })
end

local function lsp_highlight_document(client)
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

M.on_attach = function(client, bufnr)
  require('configs.lsp.formatting').setup(client, bufnr)
  lsp_highlight_document(client)
  local opts = {buffer=bufnr}
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function() vim.inspect(vim.lsp.buf.list_workspace_folders()) end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>so', '<cmd> Telescope lsp_document_symbols<cr>', opts)
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.formatting, {})
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
M.capabilities.textDocument.completion.completionItem.documentationFormat = {
  'markdown',
  'plaintext'
}
M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
M.capabilities.textDocument.completion.completionItem.preselectSupport = true
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties={'documentation', 'detail', 'additionalTextEdits'}
}
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.tagSupport = {valueSet={1}}

return M
