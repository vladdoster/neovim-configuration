-- PACKER BOOTSTRAP <<
local warm_boot, packer = pcall(require, 'packer')
if not warm_boot then
  local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '1',
    packer_path
  }
  vim.cmd 'packadd packer.nvim'
  packer = require 'packer'
end
packer.init {
  auto_clean=true,
  compile_on_sync=true,
  git={clone_timeout=6000, subcommands={update='pull --ff-only --progress --rebase=true'}},
  profile={enable=true, threshold=0.0001}
} -- >>
local cfg = function(name) return string.format([[require("configs.%s")]], name) end
return packer.startup(function(use)
  -- ╭─────────────╮
  -- │ PERFORMANCE │
  -- ╰─────────────╯
  use {
    'wbthomason/packer.nvim',
    'nvim-lua/plenary.nvim',
    'lewis6991/impatient.nvim',
    'tweekmonster/startuptime.vim'
    -- {
    --   'antoinemadec/FixCursorHold.nvim',
    --   config=[[vim.g.cursorhold_updatetime = 100]],
    --   event={'BufRead', 'BufNewFile'}
    -- }
  } --
  -- ╭────╮
  -- │ UI │
  -- ╰────╯
  use {
    'MunifTanjim/nui.nvim',
    'nvim-lua/popup.nvim',
    {'b0o/incline.nvim', config=[[require 'incline'.setup()]]},
    {'rcarriga/nvim-notify', config=cfg 'notify'},
    {'nvim-lualine/lualine.nvim', config=cfg 'lualine'},
    {'rktjmp/lush.nvim', {'olimorris/onedarkpro.nvim', config=cfg 'color-scheme'}}
  }
  -- ╭──────────────╮
  -- │ PRODUCTIVITY │
  -- ╰──────────────╯
  use {
    'b0o/mapx.nvim',
    'junegunn/vim-easy-align',
    'obreitwi/vim-sort-folds',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    {'LudoPinelli/comment-box.nvim', config=cfg 'comment-box'},
    {'jose-elias-alvarez/null-ls.nvim', event={'BufRead'}, config=cfg 'null-ls'},
    {'lewis6991/gitsigns.nvim', event={'BufRead', 'BufNewFile'}, config=cfg 'gitsigns'},
    {'lukas-reineke/indent-blankline.nvim', config=cfg 'indentline'},
    {'numToStr/Buffers.nvim', event={'BufRead'}},
    {'numToStr/Comment.nvim', config=cfg('comment'), event='BufRead'},
    {'nvim-neo-tree/neo-tree.nvim', module='neo-tree', cmd='Neotree', config=cfg 'neo-tree'},
    {'sQVe/sort.nvim', config=[[require 'sort'.setup()]]},
    {'vladdoster/remember.nvim', config=[[require 'remember']]}
  }
  use {
    'akinsho/nvim-toggleterm.lua',
    cmd='ToggleTerm',
    config=cfg 'toggle-term',
    module='toggle-term'
  }
  --  ╭────────────╮
  --  │ TREESITTER │
  --  ╰────────────╯
  use {
    'nvim-treesitter/nvim-treesitter',
    cmd={'TSEnableAll', 'TSInstall', 'TSUpdate'},
    config=cfg 'treesitter',
    event={'BufRead', 'BufNewFile'},
    run=':TSUpdate'
  }
  --  ╭────────────╮
  --  │ COMPLETION │
  --  ╰────────────╯
  use {
    'onsails/lspkind-nvim',
    {'rafamadriz/friendly-snippets', after='nvim-cmp'},
    {'L3MON4D3/LuaSnip', after='friendly-snippets', config=cfg 'luasnip'},
    {'hrsh7th/cmp-buffer', after='nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp', after='nvim-cmp'},
    {'hrsh7th/cmp-path', after='nvim-cmp'},
    {'saadparwaiz1/cmp_luasnip', after='nvim-cmp'},
    {'hrsh7th/nvim-cmp', config=cfg 'lsp.cmp', event='InsertEnter'},
    {
      'williamboman/nvim-lsp-installer',
      cmd={'LspInstall', 'LspUninstall'},
      module='nvim-lsp-installer'
    }
  }
  use {'neovim/nvim-lspconfig', event='BufWinEnter', config=cfg 'lsp'}
  --  ╭──────────────╮
  --  │ FUZZY FINDER │
  --  ╰──────────────╯
  use {'nvim-telescope/telescope-fzf-native.nvim', run='make'}
  use {'nvim-telescope/telescope.nvim', cmd='Telescope', config=cfg 'telescope'}
  if not warm_boot then packer.sync() end
end)

-- vim:ft=lua:sw=2:sts=2:et:foldmarker=<<,>>:foldmethod=marker
