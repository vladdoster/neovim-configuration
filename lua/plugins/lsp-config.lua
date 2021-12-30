local present0, lspconfig = pcall(require, 'lspconfig')
local present1, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not (present0 or present1) then return end
local function on_attach(_, bufnr)
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = true }
    map('n', 'gD',        '<cmd>lua vim.lsp.buf.declaration()<CR>',                                opts)
    map('n', 'gd',        '<cmd>lua vim.lsp.buf.definition()<CR>',                                 opts)
    map('n', 'K',         '<cmd>lua vim.lsp.buf.hover()<CR>',                                      opts)
    map('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>',                             opts)
    map('n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>',                             opts)
    map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                       opts)
    map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                    opts)
    map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    map('n', '<space>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>',                            opts)
    map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',                                     opts)
    map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',                                opts)
    map('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>',                                 opts)
    map('n', '<space>e',  '<cmd>lua vim.diagnostic.open_float()<CR>',                              opts)
    map('n', '[d',        '<cmd>lua vim.diagnostic.goto_prev()<CR>',                               opts)
    map('n', ']d',        '<cmd>lua vim.diagnostic.goto_next()<CR>',                               opts)
    map('n', '<space>q',  '<cmd>lua vim.diagnostic.setloclist()<CR>',                              opts)
    map('n', '<space>f',  '<cmd>lua vim.lsp.buf.formatting()<CR>',                                 opts)
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport       = true
capabilities.textDocument.completion.completionItem.documentationFormat     = {"markdown","plaintext"}
capabilities.textDocument.completion.completionItem.insertReplaceSupport    = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport     = true
capabilities.textDocument.completion.completionItem.preselectSupport        = true
capabilities.textDocument.completion.completionItem.resolveSupport          = {properties={"documentation","detail","additionalTextEdits"}}
capabilities.textDocument.completion.completionItem.snippetSupport          = true
capabilities.textDocument.completion.completionItem.tagSupport              = {valueSet={1}}
-- Borders
vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
local border = {
    {'🭽', 'FloatBorder'}, {'▔', 'FloatBorder'}, {'🭾', 'FloatBorder'}, {'▕', 'FloatBorder'},
    {'🭿', 'FloatBorder'}, {'▁', 'FloatBorder'}, {'🭼', 'FloatBorder'}, {'▏', 'FloatBorder'}
}
local handlers = {
    ['textDocument/hover']=vim.lsp.with(vim.lsp.handlers.hover, {border=border}),
    ['textDocument/signatureHelp']=vim.lsp.with(vim.lsp.handlers.signature_help, {border=border}),
    ['textDocument/publishDiagnostics']=vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert=true })
}
lsp_installer.on_server_ready(function(server)
    local opts = { capabilities=capabilities, flags={debounce_text_changes=150}, handlers=handlers, on_attach=on_attach }
    if server.name == 'sumneko_lua' then
        opts.settings = { Lua={ diagnostics={globals={'vim'}}, workspace={ maxPreload=100000, preloadFileSize=10000, library={ [vim.fn.expand '$VIMRUNTIME/lua']=true, [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp']=true }, }, telemetry={enable=false} } }
    end
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
