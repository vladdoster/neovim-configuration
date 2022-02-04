local present, cmp = pcall(require, 'cmp')
if not present then return end
vim.opt.completeopt = 'menuone,noselect'

  cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>']=cmp.mapping.confirm {
            behavior=cmp.ConfirmBehavior.Replace,
            select=true
        },
        ['<Tab>']=function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require('luasnip').expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                    '<Plug>luasnip-expand-or-jump', true, true,
                                    true), '')
            else
                fallback()
            end
        end,
        ['<S-Tab>']=function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require('luasnip').jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                    '<Plug>luasnip-jump-prev', true, true, true),
                                '')
            else
                fallback()
            end
        end
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    })
    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      sources = {
        { name = 'buffer' }
      }
    })
    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
