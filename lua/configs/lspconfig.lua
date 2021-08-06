local dep_0, lsp_config = pcall(require, "lspconfig")
local dep_1, lsp_install = pcall(require, "lspinstall")
local dep_2, lsp_signature = pcall(require, "lsp_signature")
local dep_3, lsp_aerial = pcall(require, "aerial")
if not (dep_0 or dep_1 or dep_2 or dep_3) then return end

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    lsp_aerial.on_attach(client)

    lsp_signature.on_attach({
        bind = true,
        use_lspsaga = false,
        floating_window = true,
        fix_pos = false,
        hint_enable = true,
        hi_parameter = "Search",
        handler_opts = {"shadow"}
    })
    -- mappings
    local opts = {noremap = true, silent = true}
    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    keymap("n", "<space>e",
           "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
           opts)
    keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
           opts)
    keymap("n", "<space>wl",
           "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
           opts)
    keymap("n", "<space>wr",
           "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)

    keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    -- keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
               opts)
    end

    -- autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
end

-- enable snippet support in lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}

local function setup_servers()
    local servers = require("lspinstall").installed_servers()
    for _, server in pairs(servers) do
        require("lspconfig")[server].setup({
            on_attach = on_attach,
            capabilities = capabilities
        })
    end
end
setup_servers()

require("lspinstall").post_install_hook = function()
    setup_servers()
    vim.cmd("bufdo e")
end

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
    if msg:match("exit code") then return end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({{msg}}, true, {})
    end
end
