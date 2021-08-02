local dep_0, lspconfig = pcall(require, "lspconfig")
local dep_1, lspinstall = pcall(require, "lspinstall")
local dep_2, lsp_signature = pcall(require, "lsp_signature")
if not (dep_0 or dep_1 or dep_2) then
	return
end

local on_attach = function(client, bufnr)
	-- LSP Signature
	lsp_signature.on_attach({
		bind = true,
		use_lspsaga = false,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hi_parameter = "Search",
		handler_opts = { "shadow" },
	})
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	end
	if client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

-- Enable Snippet Support in Lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

-- List LSP Servers here
local function setup_servers()
	require("lspinstall").setup()
	local servers = require("lspinstall").installed_servers()
	for _, server in pairs(servers) do
		require("lspconfig")[server].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
