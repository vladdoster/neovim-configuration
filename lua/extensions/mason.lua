local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local servers = {pyright={}, lua_ls={Lua={workspace={checkThirdParty=false}, telemetry={enable=false}}}}

mason.setup()
mason_lspconfig.setup({ensure_installed={"lua_ls", "pyright"}});

-- Setup every needed language server in lspconfig
mason_lspconfig.setup_handlers{
  function(server_name)
    lspconfig[server_name].setup{}
  end
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
