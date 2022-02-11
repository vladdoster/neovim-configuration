local M = {}
local utils = require "core.utils"
local config = utils.user_settings()
local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
  return
end
packer.startup {
  function(use)
    use { "wbthomason/packer.nvim", }
    use { "lewis6991/impatient.nvim", }
    use { "dstein64/vim-startuptime", cmd="StartupTime" }
    use { "nvim-lua/plenary.nvim", }
    use { "nvim-lua/popup.nvim", }
    use {
      "karb94/neoscroll.nvim",
      event = "BufRead",
      config = function()
        require("configs.neoscroll").config()
      end,
    }
    use {'junegunn/vim-easy-align'}
    use {'tpope/vim-repeat'}
    use {'winston0410/commented.nvim', config=[[require 'commented'.setup()]]}
    use {'sQVe/sort.nvim', config=[[require("sort").setup()]]}
    use {
      "nathom/filetype.nvim",
      config = function()
        vim.g.did_load_filetypes = 1
      end,
    }
    use { 'ethanholz/nvim-lastplace', config = [[require'nvim-lastplace'.setup{}]] }
    use {
      "antoinemadec/FixCursorHold.nvim",
      event = "BufRead",
      config = function()
        vim.g.cursorhold_updatetime = 100
      end,
    }
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("configs.icons").config()
      end,
    }
    use {
      "akinsho/bufferline.nvim",
      after = "nvim-web-devicons",
      config = function()
        require("configs.bufferline").config()
      end,
    }
    use {
      'famiu/feline.nvim',
      config= function()
        require('feline').setup({
            preset = 'noicon'
        })
      end
    }
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      event = "BufRead",
      cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSDisableAll",
        "TSEnableAll",
      },
      config = function()
        require("configs.treesitter").config()
      end,
      requires = {
        { "p00f/nvim-ts-rainbow", after = "nvim-treesitter", },
        { "windwp/nvim-ts-autotag", after = "nvim-treesitter", },
        { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
      },
    }
    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
      requires = {
        "rafamadriz/friendly-snippets",
      },
    }
    use {
      "hrsh7th/nvim-cmp",
      event = "BufRead",
      config = function()
        require("configs.cmp").config()
      end,
    }
    use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp", }
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp", }
    use { "hrsh7th/cmp-path", after = "nvim-cmp", }
    use { "hrsh7th/cmp-nvim-lsp", }
    use {
      "williamboman/nvim-lsp-installer",
      event = "BufRead",
      cmd = {
        "LspInstall",
        "LspInstallInfo",
        "LspPrintInstalled",
        "LspRestart",
        "LspStart",
        "LspStop",
        "LspUninstall",
        "LspUninstallAll",
      },
    }
    use { "neovim/nvim-lspconfig",
      event = "BufRead",
      config = function()
        require "configs.lsp"
      end,
    }
    use {
      "tami5/lspsaga.nvim",
      event = "BufRead",
      config = function()
        require("configs.lsp.lspsaga").config()
      end,
    }
    use {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      setup = function()
        require("configs.symbols-outline").setup()
      end,
    }
    use {
      "jose-elias-alvarez/null-ls.nvim",
      event = "BufRead",
      config = function()
        require "user.null-ls".config()
      end,
    }
    use {"nvim-telescope/telescope-file-browser.nvim" }
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    }
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      config = function() require("configs.telescope").config() end,
      after = { 
        "telescope-file-browser",
        "telescope-fzf-native"
      }
    }
    use {
      "glepnir/dashboard-nvim",
      config = function()
        require("configs.dashboard").config()
      end,
    }
    use {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
        require("configs.colorizer").config()
      end,
    }
    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require("configs.autopairs").config()
      end,
    }
    use {
      "akinsho/nvim-toggleterm.lua",
      cmd = "ToggleTerm",
      config = function()
        require("configs.toggleterm").config()
      end,
    }
    use {
      "numToStr/Comment.nvim",
      event = "BufRead",
      config = function()
        require("configs.comment").config()
      end,
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("configs.indent-line").config()
      end,
    }
    use {
      "folke/which-key.nvim",
      config = function()
        require("configs.which-key").config()
      end,
    }
    use {
        'rcarriga/nvim-notify',
        config=function()
            vim.notify = require 'notify'
            require('notify').setup { stages='slide', timeout=2500, minimum_width=50, icons={ ERROR='', WARN='', INFO='', DEBUG='', TRACE='✎' } }
        end
    }
  end,
  config = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
    profile = {
      enable = true,
      threshold = 0.0001,
    },
    git = {
      clone_timeout = 300,
    },
    auto_clean = true,
    compile_on_sync = true,
  },
}
return M
