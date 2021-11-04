local present0, lspconfig = pcall(require, 'lspconfig')
local present1, lsp_installer = pcall(require, 'nvim-lsp-installer')
local present2, lspsaga = pcall(require, 'lspsaga')
-- for _, module in ipairs({'lspconfig', 'nvim-lsp-installer', 'lspsaga'}) do
-- local ok, err = pcall(require, module)
-- if not ok then error("Error loading " .. module .. "\n\n" .. err) end
-- end

-- lspconfig, lsp_installer, lspsaga = unpack(table.foreach({'lspconfig', 'nvim-lsp-installer', 'lspsaga'}, function(k,v) if ok, _ pcall(require, v) end))

if not (present0 or present1 or present2) then return end

local function on_attach(_, bufnr)
    local function buf_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap=true, silent=true}
    local map = vim.api.nvim_buf_set_keymap
    map(0, 'n', 'gr', '<cmd>Lspsaga rename<cr>', {silent=true, noremap=true})
    map(
        0, 'n', 'gx', '<cmd>Lspsaga code_action<cr>',
        {silent=true, noremap=true})
    map(
        0, 'x', 'gx', ':<c-u>Lspsaga range_code_action<cr>',
        {silent=true, noremap=true})
    map(0, 'n', 'K', '<cmd>Lspsaga hover_doc<cr>', {silent=true, noremap=true})
    map(
        0, 'n', 'go', '<cmd>Lspsaga show_line_diagnostics<cr>',
        {silent=true, noremap=true})
    map(
        0, 'n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>',
        {silent=true, noremap=true})
    map(
        0, 'n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>',
        {silent=true, noremap=true})
    map(
        0, 'n', '<C-u>',
        '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<cr>',
        {silent=true, noremap=true})
    map(
        0, 'n', '<C-d>',
        '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<cr>',
        {silent=true, noremap=true})
    -- buf_keym0, ap("n"<leader>, "K",  "<cmd>lua lsp_buf.hover()<CR>", opts)
    -- buf_keymap(0, "n", "<leader>gD", "<cmd>lua lsp_buf.declaration()<CR>", opts)
    -- buf_keymap(0, "n", "<leader>gd", "<cmd>lua lsp_buf.definition()<CR>", opts)
    -- buf_keymap(0, "n", "<leader>gi", "<cmd>lua lsp_buf.implementation()<CR>", opts)
    -- buf_keymap("n", "gk", "<cmd>lua lsp_buf.signature_help()<CR>", opts)
    -- buf_keymap("n", "<leader>wa", "<cmd>lua lsp_buf.add_workspace_folder()<CR>", opts)
    -- buf_keymap("n", "<leader>wr", "<cmd>lua lsp_buf.remove_workspace_folder()<CR>", opts)
    -- buf_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(lsp_buf.list_workspace_folders()))<CR>", opts)
    -- buf_keymap("n", "<leader>D", "<cmd>lua lsp_buf.type_definition()<CR>", opts)
    -- buf_keymap("n", "<leader>rn", "<cmd>lua lsp_buf.rename()<CR>", opts)
    -- buf_keymap("n", "<leader>ca", "<cmd>lua lsp_buf.code_action()<CR>", opts)
    -- buf_keymap("n", "gr", "<cmd>lua lsp_buf.references()<CR>", opts)
    -- buf_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    -- buf_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    -- buf_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    -- buf_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    -- buf_keymap("n", "<leader>f", "<cmd>lua lsp_buf.formatting()<CR>", opts)
    -- buf_keymap("v", "<leader>ca", "<cmd>lua lsp_buf.range_code_action()<CR>", opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
                         vim.lsp.protocol.make_client_capabilities())
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
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

lsp_installer.on_server_ready(
    function(server)
        local opts = {
            on_attach=on_attach,
            capabilities=capabilities,
            flags={debounce_text_changes=150}
        }
        if server.name == 'sumneko_lua' then
            opts.settings = {
                Lua={
                    diagnostics={globals={'vim'}},
                    workspace={
                        library={
                            [vim.fn.expand '$VIMRUNTIME/lua']=true,
                            [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp']=true
                        },
                        maxPreload=100000,
                        preloadFileSize=10000
                    },
                    telemetry={enable=false}
                }
            }
        end
        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
    end)

-- -- replace the default lsp diagnostic symbols
-- local function lspSymbol(name, icon)
-- vim.fn.sign_define(
-- "LspDiagnosticsSign" .. name,
-- { text = icon, numhl = "LspDiagnosticsDefault" .. name }
-- )
-- end
-- lspSymbol("Error", "")
-- lspSymbol("Information", "")
-- lspSymbol("Hint", "")
-- lspSymbol("Warning", "")
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- vim.lsp.diagnostic.on_publish_diagnostics,
-- {
-- virtual_text = {
-- prefix = "",
-- spacing = 0
-- },
-- signs = true,
-- underline = true,
-- update_in_insert = false,
-- }
-- )
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _)
    if msg:match 'exit code' then return end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({{msg}}, true, {})
    end
end
