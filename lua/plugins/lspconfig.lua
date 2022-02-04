local present1, lspconfig = pcall(require, 'lspconfig')
local present2, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not (present1 or present2) then return end

local function on_attach(_, bufnr)
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    require'lsp_signature'.on_attach({
        bind=true,
        handler_opts={border='rounded'}
    }, bufnr)
    local opts = {noremap=true, silent=true}
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
        opts)
    map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
        opts)
    map('n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
        opts)
    map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.documentationFormat = {
    'markdown',
    'plaintext'
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport =
    true
capabilities.textDocument.completion.completionItem.tagSupport = {valueSet={1}}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties={'documentation', 'detail', 'additionalTextEdits'}
}
lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities=capabilities,
        flags={debounce_text_changes=150},
        on_attach=on_attach
    }
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
local function lspSymbol(name, icon)
    vim.fn.sign_define('LspDiagnosticsSign' .. name,
                       {text=icon, numhl='LspDiagnosticsDefaul' .. name})
end
lspSymbol('Error', '')
lspSymbol('Information', '')
lspSymbol('Hint', '')
lspSymbol('Warning', '')
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text={prefix='', spacing=0},
        signs=true,
        underline=true,
        update_in_insert=false -- update diagnostics insert mode
    })
vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, {border='rounded'})
vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {border='rounded'})
