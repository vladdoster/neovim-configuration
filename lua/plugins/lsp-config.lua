local present0, lspconfig = pcall(require, 'lspconfig')
local present1, lsp_installer = pcall(require, 'nvim-lsp-installer')
local present2, lspsaga = pcall(require, 'lspsaga')

if not (present0 or present1 or present2) then return end

local function on_attach(_, bufnr)
    local function buf_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap=true, silent=true}
    local map = vim.api.nvim_buf_set_keymap
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<leader>wa',
        '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<leader>wr',
        '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<leader>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
        opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
        opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<leader>e',
        '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<leader>q',
        '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr, 'n', '<leader>so',
        [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
        opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
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
local function goto_definition(split_cmd)
    local util = vim.lsp.util
    local log = require('vim.lsp.log')
    local api = vim.api
    local handler =
        function(_, result, ctx) -- this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
            if result == nil or vim.tbl_isempty(result) then
                local _ =
                    log.info() and log.info(ctx.method, 'No location found')
                return nil
            end
            if split_cmd then vim.cmd(split_cmd) end
            if vim.tbl_islist(result) then
                util.jump_to_location(result[1])
                if #result > 1 then
                    util.set_qflist(util.locations_to_items(result))
                    api.nvim_command('copen')
                    api.nvim_command('wincmd p')
                end
            else
                util.jump_to_location(result)
            end
        end
    return handler
end

vim.lsp.handlers['textDocument/definition'] = goto_definition('split')
-- LSP signs
local signs = {Error=' ', Warn=' ', Hint=' ', Info=' '}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, {text=icon, texthl=hl, numhl=hl})
end
-- Borders
vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
local border = {
    {'🭽', 'FloatBorder'},
    {'▔', 'FloatBorder'},
    {'🭾', 'FloatBorder'},
    {'▕', 'FloatBorder'},
    {'🭿', 'FloatBorder'},
    {'▁', 'FloatBorder'},
    {'🭼', 'FloatBorder'},
    {'▏', 'FloatBorder'}
}
local handlers = {
    ['textDocument/definition']=goto_definition('split'),
    ['textDocument/hover']=vim.lsp.with(vim.lsp.handlers.hover, {border=border}),
    ['textDocument/signatureHelp']=vim.lsp.with(
        vim.lsp.handlers.signature_help, {border=border}),
    ['textDocument/publishDiagnostics']=vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {update_in_insert=true})
}
lsp_installer.on_server_ready(
    function(server)
        local opts = {
            capabilities=capabilities,
            flags={debounce_text_changes=150},
            handlers=handlers,
            on_attach=on_attach
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
-- -- suppress error messages from lang servers
-- vim.notify = function(msg, log_level, _)
-- if msg:match 'exit code' then return end
-- if log_level == vim.log.levels.ERROR then
-- vim.api.nvim_err_writeln(msg)
-- else
-- vim.api.nvim_echo({{msg}}, true, {})
-- end
-- end
