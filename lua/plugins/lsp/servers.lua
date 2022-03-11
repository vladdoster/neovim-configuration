local lsp = require('lspconfig')
local U = require('plugins.lsp.utils')
local capabilities = U.capabilities()
local flags = {allow_incremental_sync=true, debounce_text_changes=200}
vim.diagnostic.config({virtual_text={source='always'}, float={source='always'}})
lsp.sumneko_lua.setup({
  flags=flags,
  capabilities=capabilities,
  on_attach=function(client, buf)
    U.disable_formatting(client)
    U.mappings(buf)
  end,
  settings={
    Lua={
      completion={
        enable=true,
        showWord='Disable' -- keywordSnippet = 'Disable',
      },
      runtime={ -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version='LuaJIT',
        path=U.get_luajit_path()
      },
      diagnostis={globals={'vim', 'dump'}},
      workspace={ -- Make the server aware of Neovim runtime files
        library=U.get_nvim_rtp_path()
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry={enable=false}
    }
  }
})

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  local opts = {
    flags=flags,
    capabilities=capabilities,
    on_attach=function(client, buf)
      U.disable_formatting(client)
      U.mappings(buf)
    end
  }

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end

  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
