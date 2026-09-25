local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then return false end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match('%s') == nil
end

return {
  {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then return end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
        opts = {},
      },
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        -- Cycle to the next item if the menu is open, else jump to the next snippet placeholder,
        -- else show the menu and insert the first item after a word.
        ['<Tab>'] = {
          function(cmp)
            if cmp.is_menu_visible() then return cmp.insert_next() end
          end,
          'snippet_forward',
          function(cmp)
            if has_words_before() then return cmp.show_and_insert() end
          end,
          'fallback',
        },
        -- Cycle to the previous item if the menu is open, else jump to the previous snippet placeholder.
        ['<S-Tab>'] = {
          function(cmp)
            if cmp.is_menu_visible() then return cmp.insert_prev() end
          end,
          'snippet_backward',
          'fallback',
        },
        -- <C-space> is the WezTerm leader, so <C-d> toggles the documentation window.
        ['<C-d>'] = {
          'show_documentation',
          'hide_documentation',
          function(cmp) return cmp.is_menu_visible() end,
          'fallback',
        },
      },
      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
        -- Without a Nerd Font, show short text labels in place of the kind icons.
        kind_icons = not vim.g.have_nerd_font and {
          Text = 'Txt',
          Method = 'Meth',
          Function = 'Fn',
          Constructor = 'Ctor',

          Field = 'Fld',
          Variable = 'Var',
          Property = 'Prop',

          Class = 'Cls',
          Interface = 'Intf',
          Struct = 'Strc',
          Module = 'Mod',

          Unit = 'Unit',
          Value = 'Val',
          Enum = 'Enum',
          EnumMember = 'EnMb',

          Keyword = 'Kw',
          Constant = 'Cnst',

          Snippet = 'Snip',
          Color = 'Clr',
          File = 'File',
          Reference = 'Ref',
          Folder = 'Dir',
          Event = 'Evt',
          Operator = 'Op',
          TypeParameter = 'TPar',
        } or nil,
      },
      completion = {
        list = { selection = { preselect = false }, cycle = { from_top = false } },
        -- Press <C-d> to show or hide the documentation.
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- lazydev only serves Lua buffers, so blink loads it on demand there.
        per_filetype = { lua = { inherit_defaults = true, 'lazydev' } },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      snippets = { preset = 'luasnip' },
      -- Sort exact matches first; blink's own default is { 'score', 'sort_text' }.
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = {
        sorts = {
          'exact',
          'score',
          'sort_text',
        },
      },
      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
