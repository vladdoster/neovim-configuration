-- PACKER BOOTSTRAP
local warm_boot, packer = pcall(require, 'packer')
if not warm_boot then
  local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path}
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
local setup = function(name) return string.format([[require("%s").setup()]], name) end
return packer.startup(function(use)
  -- ╭─────────────╮
  -- │ PERFORMANCE │
  -- ╰─────────────╯
  use {'wbthomason/packer.nvim', 'nvim-lua/plenary.nvim', 'lewis6991/impatient.nvim', 'dstein64/vim-startuptime'}
  use {'nvim-lua/popup.nvim'}
  use {'nathom/filetype.nvim'}
  -- ╭────╮
  -- │ UI │
  -- ╰────╯
  use {
    {'nvim-lualine/lualine.nvim', event='BufEnter', config=cfg 'lualine'},
    {'j-hui/fidget.nvim', after='lualine.nvim', config=setup('fidget')},
    {'rcarriga/nvim-notify', config=cfg 'notify'},
    {'editorconfig/editorconfig-vim'},
    {'rktjmp/lush.nvim', requires={{'olimorris/onedarkpro.nvim', config=cfg 'color-scheme'}}}
  }
  -- ╭──────────────╮
  -- │ PRODUCTIVITY │
  -- ╰──────────────╯
  use {'junegunn/vim-easy-align', cmd='EasyAlign', opt=true}
  use {'obreitwi/vim-sort-folds', cmd='SortFolds', opt=true}
  use {'tpope/vim-surround', event='BufRead', requires={{'tpope/vim-repeat', event='BufRead'}}}
  use {'sQVe/sort.nvim', cmd='Sort', config=setup('sort'), opt=true}
  use {'monaqa/dial.nvim', config=cfg 'dial'}

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch='v2.x',
    config=cfg 'neo-tree',
    requires={'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim'}
  }
  use {'LudoPinelli/comment-box.nvim', config=cfg 'comment-box'}
  use {'akinsho/nvim-toggleterm.lua', cmd='ToggleTerm', config=cfg 'toggle-term', module='toggle-term'}
  use {'lewis6991/gitsigns.nvim', event={'BufRead', 'BufNewFile'}, config=cfg 'gitsigns'}
  use {'lukas-reineke/indent-blankline.nvim', config=cfg 'indentline', event='BufEnter'}
  use {'norcalli/nvim-colorizer.lua', config=setup('colorizer')}
  use {'numToStr/Buffers.nvim', event='BufRead'}
  use {'numToStr/Comment.nvim', config=cfg 'comment', event='BufRead'}
  use {'vladdoster/remember.nvim', config=[[require 'remember']]}
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
  use {'onsails/lspkind-nvim'}
  use {'williamboman/nvim-lsp-installer'}
  use {
    'neovim/nvim-lspconfig',
    event='BufRead',
    config=cfg('lsp.servers'),
    requires={{'hrsh7th/cmp-nvim-lsp', {'stevearc/aerial.nvim', config=cfg 'aerial'}}}
  }
  use {'jose-elias-alvarez/null-ls.nvim', event='BufRead', config=cfg('lsp.null-ls')}
  use {
    {
      'hrsh7th/nvim-cmp',
      event='InsertEnter',
      config=cfg('lsp.cmp'),
      requires={
        {'L3MON4D3/LuaSnip', event='CursorHold', config=cfg('lsp.lua-snip'), requires={'rafamadriz/friendly-snippets'}}
      }
    },
    {'saadparwaiz1/cmp_luasnip', after='nvim-cmp'},
    {'hrsh7th/cmp-path', after='nvim-cmp'},
    {'hrsh7th/cmp-buffer', after='nvim-cmp'}
  }
  --  ╭──────────────╮
  --  │ FUZZY FINDER │
  --  ╰──────────────╯
  use {
    'nvim-telescope/telescope.nvim',
    config=cfg('telescope'),
    cmd='Telescope',
    event='CursorHold',
    requires={
      {'ANGkeith/telescope-terraform-doc.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run='make'},
      {'nvim-telescope/telescope-project.nvim'},
      {'nvim-telescope/telescope-symbols.nvim'},
      {'stevearc/aerial.nvim', config=cfg 'aerial'}
    }
  }
  use {'windwp/nvim-autopairs', config=cfg('pairs')}
  if not warm_boot then packer.sync() end
end)

-- vim:ft=lua:sw=2:sts=2:et:
