-- PACKER BOOTSTRAP
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
}
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
  }
  -- ╭────╮
  -- │ UI │
  -- ╰────╯
  use {'MunifTanjim/nui.nvim'}
  use {
    's1n7ax/nvim-window-picker',
    tag='v1.*',
    config=function() require'window-picker'.setup() end
  }
  use {'b0o/incline.nvim', config=cfg 'incline'}
  use {'nvim-lua/popup.nvim'}
  use {
    {'nvim-lualine/lualine.nvim', event='BufEnter', config=cfg 'lualine'},
    {'j-hui/fidget.nvim', after='lualine.nvim', config=function() require('fidget').setup() end}
  }
  use {'rcarriga/nvim-notify', config=cfg 'notify'}
  use {'rktjmp/lush.nvim', requires={{'olimorris/onedarkpro.nvim', config=cfg 'color-scheme'}}}
  -- ╭──────────────╮
  -- │ PRODUCTIVITY │
  -- ╰──────────────╯
  use {'junegunn/vim-easy-align', cmd='EasyAlign', opt=true}
  use {'obreitwi/vim-sort-folds', cmd='SortFolds', opt=true}
  use {'tpope/vim-surround', event='BufRead', requires={{'tpope/vim-repeat', event='BufRead'}}}
  use {'sQVe/sort.nvim', cmd='Sort', config=function() require('sort').setup() end, opt=true}
  use {'monaqa/dial.nvim', config=cfg 'dial'}

  use {
    {'LudoPinelli/comment-box.nvim', config=cfg 'comment-box'},
    {'jose-elias-alvarez/null-ls.nvim'},
    {'norcalli/nvim-colorizer.lua', config=function() require('colorizer').setup() end},
    {'lewis6991/gitsigns.nvim', event={'BufRead', 'BufNewFile'}, config=cfg 'gitsigns'},
    {'lukas-reineke/indent-blankline.nvim', config=cfg 'indentline'},
    {'numToStr/Buffers.nvim', event='BufRead'},
    {'numToStr/Comment.nvim', config=cfg 'comment', event='BufRead'},
    {'nvim-neo-tree/neo-tree.nvim', module='neo-tree', cmd='Neotree', config=cfg 'neo-tree'},
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
    {'hrsh7th/nvim-cmp', config=cfg 'lsp.cmp', event='BufEnter'},
    {'saadparwaiz1/cmp_luasnip', after='nvim-cmp'},
    {
      'williamboman/nvim-lsp-installer',
      {'neovim/nvim-lspconfig', config=cfg 'lsp', after='nvim-cmp'}
    }
  }

  --  ╭──────────────╮
  --  │ FUZZY FINDER │
  --  ╰──────────────╯
  use {
    'nvim-telescope/telescope.nvim',
    cmd='Telescope',
    config=cfg 'telescope',
    requires={
      {'nvim-lua/plenary.nvim'},
      {'ANGkeith/telescope-terraform-doc.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run='make'},
      {'nvim-telescope/telescope-project.nvim'}
    }
  }
  if not warm_boot then packer.sync() end
end)

-- vim:ft=lua:sw=2:sts=2:et:
