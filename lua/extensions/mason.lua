local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  lua_ls={Lua={workspace={checkThirdParty=false}, telemetry={enable=false}}}
}

mason.setup()
mason_lspconfig.setup({
  ensure_installed={
    "lua_ls", -- LSP for Lua language
    "tsserver", -- LSP for Typescript and Javascript
    "emmet_ls", -- LSP for Emmet (Vue, HTML, CSS)
    "cssls", -- LSP for CSS
    "pyright", -- LSP for Python
    "volar", -- LSP for Vue
    "gopls" -- LSP for Go
  }
});

-- Setup every needed language server in lspconfig
mason_lspconfig.setup_handlers{
  function(server_name)
    lspconfig[server_name].setup{}
  end
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
