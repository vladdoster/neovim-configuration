local lsp = require('lsp-zero').preset({})
local lsp_zero = require('lsp-zero')
-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.set_log_level('debug')

cmp.setup({
  sources={
    {name='nvim_lsp'},
    {name='treesitter'},
    {name='buffer'},
    {name='luasnip'},
    {name='path'},
  },
  window={completion={winhighlight='Normal:Pmenu,FloatBorder:Pmenu,Search:None', col_offset=-3, side_padding=0}},
  mapping={
    ['<CR>']=cmp.mapping.confirm({select=false}),
    ['<C-Space>']=cmp.mapping.complete(),
    ['<C-f>']=cmp_action.luasnip_jump_forward(),
    ['<C-b>']=cmp_action.luasnip_jump_backward()
  },
  snippet={
    expand=function(args)
      require('luasnip').lsp_expand(args.body)
    end
  }
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local servers = {'eslint', 'gopls','bashls', 'html', 'jsonls', 'pyright', 'terraformls', 'yamlls'}
for _, server in ipairs(servers) do
  require('lspconfig')[server].setup({
    capabilities=lsp_capabilities,
    on_attach=function(client, bufnr)
      lsp_zero.default_keymaps({buffer=bufnr})
    end
  })
end
