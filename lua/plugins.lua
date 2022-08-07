-- vim ft=lua sw=2 sts=2 et
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
  git={clone_timeout=6000, subcommands={update='pull --ff-only --progress --rebase'}},
  profile={enable=true, threshold=0.0001}
}
local cfg = function(name) return string.format([[require("configs.%s")]], name) end
local setup = function(name) return string.format([[require("%s").setup()]], name) end
return packer.startup(function(use)
  -- ╭─────────────╮
  -- │ PERFORMANCE │
  -- ╰─────────────╯
  use {
    'wbthomason/packer.nvim',
    'nvim-lua/plenary.nvim',
    'lewis6991/impatient.nvim',
    'dstein64/vim-startuptime',
    'nvim-lua/popup.nvim'
  }
  use {
    {'nathom/filetype.nvim', config=cfg 'filetype'},
    {
      'antoinemadec/FixCursorHold.nvim',
      event={'BufRead', 'BufNewFile'},
      config=function() vim.g.cursorhold_updatetime = 100 end
    }
  }
  -- ╭────╮
  -- │ UI │
  -- ╰────╯
  use {
    {'stevearc/aerial.nvim', config=cfg 'aerial'},
    {'nvim-lualine/lualine.nvim', event='BufEnter', config=cfg 'lualine'},
    {'rcarriga/nvim-notify', config=cfg 'notify'},
    {'rktjmp/lush.nvim', requires={{'olimorris/onedarkpro.nvim', config=cfg 'color-scheme'}}}
  }
  -- ╭──────────────╮
  -- │ PRODUCTIVITY │
  -- ╰──────────────╯
  use {'junegunn/vim-easy-align', cmd='EasyAlign', opt=true}
  use {'obreitwi/vim-sort-folds', cmd='SortFolds', opt=true}
  use {'tpope/vim-surround', event='BufRead', requires={{'tpope/vim-repeat', event='BufRead'}}}
  use {'sQVe/sort.nvim', cmd='Sort', config=setup('sort'), opt=true}
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch='v2.x',
    config=cfg 'neo-tree',
    requires={'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', {'MunifTanjim/nui.nvim', module='nui'}}

  }
  use {
    {'LudoPinelli/comment-box.nvim', config=cfg 'comment-box'},
    {'akinsho/nvim-toggleterm.lua', cmd='ToggleTerm', config=cfg 'toggle-term', module='toggle-term'},
    {'lewis6991/gitsigns.nvim', event={'BufRead', 'BufNewFile'}, config=cfg 'gitsigns'},
    {'lukas-reineke/indent-blankline.nvim', config=cfg 'indentline', event='BufEnter'},
    {'norcalli/nvim-colorizer.lua', config=setup('colorizer')},
    {'numToStr/Buffers.nvim', event='BufRead'},
    {'numToStr/Comment.nvim', config=cfg 'comment', event='BufRead'},
    {'vladdoster/remember.nvim', config=[[require 'remember']]},
    {'hashivim/vim-terraform'}
  }
  --  ╭────────────╮
  --  │ TREESITTER │
  --  ╰────────────╯
  use {
    'nvim-treesitter/nvim-treesitter',
    cmd={'TSEnableAll', 'TSInstall', 'TSUpdate'},
    config=cfg 'treesitter',
    event={'BufRead', 'BufNewFile'},
    requires={'nvim-treesitter/nvim-treesitter-textobjects', 'p00f/nvim-ts-rainbow'},
    run=':TSUpdate'
  }
  --  ╭────────────╮
  --  │ COMPLETION │
  --  ╰────────────╯
  --
  use {
    {
      'williamboman/mason.nvim',
      config=cfg('mason'),
      requires={'neovim/nvim-lspconfig', 'williamboman/mason-lspconfig.nvim'}
    },
    'folke/lua-dev.nvim',
    'b0o/SchemaStore.nvim',
    {'vladdoster/null-ls.nvim', event={'BufRead', 'BufNewFile'}, config=cfg('lsp.null-ls')},
    'ray-x/lsp_signature.nvim',
    'lvimuser/lsp-inlayhints.nvim',
    'j-hui/fidget.nvim',
    'SmiteshP/nvim-navic'
  }
  -- Snippets
  use {
    'hrsh7th/nvim-cmp',
    requires={
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'petertriho/cmp-git',
      {
        'L3MON4D3/LuaSnip',
        requires={'rafamadriz/friendly-snippets'},
        config=function() require('luasnip.loaders.from_vscode').lazy_load() end
      },
      {'onsails/lspkind-nvim', config=function() require('lspkind').init() end}
    },
    config=cfg 'lsp.cmp'
  }
  use {
    'windwp/nvim-autopairs',
    config=cfg('pairs'),
    requires={{'s1n7ax/nvim-window-picker', config=function() require('window-picker').setup() end}}
  }
  use {
    'editorconfig/editorconfig-vim',
    setup=function()
      vim.g.EditorConfig_max_line_indicator = ''
      vim.g.EditorConfig_preserve_formatoptions = 1
    end
  }
  --  ╭──────────────╮
  --  │ FUZZY FINDER │
  --  ╰──────────────╯
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires={
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', run='make'},
      {'nvim-telescope/telescope-symbols.nvim'},
      {'stevearc/aerial.nvim', config=cfg 'aerial'}
    },
    module='Telescope',
    cmd='Telescope',
    config=cfg 'telescope'
  }
  if not warm_boot then packer.sync() end
end)
