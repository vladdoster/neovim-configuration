local present1, lspconfig = pcall(require, 'lspconfig')
local present2, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not (present1 or present2) then return end

local api = vim.api
local border_opts = {border = 'rounded', focusable = false, scope = 'line'}
local fn = vim.fn
local lsp = vim.lsp

vim.diagnostic.config({virtual_text = false, float = border_opts})
fn.sign_define('DiagnosticSignError', {text = '', texthl = 'DiagnosticSignError'})
fn.sign_define('DiagnosticSignHint', {text = '', texthl = 'DiagnosticSignHint'})
fn.sign_define('DiagnosticSignInformation', {text = '', texthl = 'DiagnosticSignInfo'})
fn.sign_define('DiagnosticSignWarn', {text = '', texthl = 'DiagnosticSignWarn'})

lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, border_opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.documentationFormat = {"markdown", "plaintext"}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}

local function on_attach(_, bufnr)
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    local opts = {noremap = true, silent = true}

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    require'lsp_signature'.on_attach({
        bind = true,
        doc_lines = 0,
        floating_window = true,
        fix_pos = true,
        hint_enable = true,
        hint_prefix = " ",
        hint_scheme = "String",
        hi_parameter = "Search",
        max_height = 22,
        max_width = 120,
        handler_opts = {border = "single"},
        zindex = 200,
        padding = ""
    }, bufnr)

    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

lsp_installer.on_server_ready(function(server)
    local opts = {capabilities = capabilities, flags = {debounce_text_changes = 150}, on_attach = on_attach}
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match('%[lspconfig%]') then return end
    notify(msg, ...)
end
