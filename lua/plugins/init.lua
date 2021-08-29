local present, packer = pcall(require, "plugins.packerInit")

if not present then
   return false
end

local use = packer.use

return packer.startup {
   function()
      use { "wbthomason/packer.nvim" }
      use { "andymass/vim-matchup" }
      use { "dstein64/vim-startuptime" }
      use { "nvim-lua/plenary.nvim" }
      use { "nvchad/extensions" }

      use {
         "marko-cerovac/material.nvim",
         config = function()
            require("plugins.configs.others").material()
         end,
      }

      use {
         "kyazdani42/nvim-web-devicons",
         config = function()
            require("nvim-web-devicons").setup()
         end,
      }

      use {
         "famiu/feline.nvim",
         config = function()
            require("feline").setup {
               preset = "noicon",
            }
         end,
         event = "BufWinEnter",
      }

      use {
         "akinsho/bufferline.nvim",
         after = "nvim-web-devicons",
         config = function()
            require "plugins.configs.bufferline"
         end,
         -- event = "BufWinEnter",
         setup = function()
            require("core.mappings").bufferline()
         end,
      }

      use {
         "lukas-reineke/indent-blankline.nvim",
         config = function()
            require("plugins.configs.others").blankline()
         end,
      }

      use {
         "nvim-treesitter/nvim-treesitter",
         after = "vim-matchup",
         config = function()
            require "plugins.configs.treesitter"
         end,
      }

      -- use {
      --    "lewis6991/gitsigns.nvim",
      --    config = function()
      --       require "plugins.configs.gitsigns"
      --    end,
      --    -- event = "BufRead",
      -- }

      -- LSP STUFF
      use {
         "kabouzeid/nvim-lspinstall",
      }

      use {
         "neovim/nvim-lspconfig",
         after = "nvim-lspinstall",
         config = function()
            require "plugins.configs.lspconfig"
         end,
      }

      use {
         "ray-x/lsp_signature.nvim",
         after = "nvim-lspconfig",
         config = function()
            require("plugins.configs.others").signature()
         end,
      }

      use {
         "jdhao/better-escape.vim",
         event = "InsertEnter",
         config = function()
            require("plugins.configs.others").better_escape()
         end,
         setup = function()
            require("core.mappings").better_escape()
         end,
      }

      use {
         "hrsh7th/nvim-cmp",
         event = "InsertEnter",
         config = function()
            require "plugins.configs.cmp"
         end,
      }

      use {
         "windwp/nvim-autopairs",
         after = "nvim-cmp",
         config = function()
            require("plugins.configs.others").autopairs()
         end,
      }

      use {
         "saadparwaiz1/cmp_luasnip",
         after = "LuaSnip",
      }

      use {
         "hrsh7th/cmp-nvim-lua",
         after = "cmp_luasnip",
      }

      use {
         "hrsh7th/cmp-nvim-lsp",
         after = "cmp-nvim-lua",
      }

      use {
         "hrsh7th/cmp-buffer",
         after = "cmp-nvim-lsp",
      }

      use {
         "rafamadriz/friendly-snippets",
         after = "cmp-buffer",
      }

      use {
         "L3MON4D3/LuaSnip",
         after = "nvim-cmp",
         wants = "friendly-snippets",
         config = function()
            require("plugins.configs.others").luasnip()
         end,
      }

      -- MISC PLUGINS
      use { "junegunn/vim-easy-align" }
      use { "tpope/vim-repeat" }
      use { "tpope/vim-surround", after = "vim-repeat" }

      -- use {
      --    "glepnir/dashboard-nvim",
      --    cmd = {
      --       "Dashboard",
      --       "DashboardNewFile",
      --       "DashboardJumpMarks",
      --    },
      --    config = function()
      --       require "plugins.configs.dashboard"
      --    end,
      --    setup = function()
      --       require("core.mappings").dashboard()
      --    end,
      -- }

      use {
         "sbdchd/neoformat",
         cmd = "Neoformat",
         setup = function()
            require("core.mappings").neoformat()
         end,
      }

      use {
         "terrortylor/nvim-comment",
         cmd = "CommentToggle",
         config = function()
            require("plugins.configs.others").comment()
         end,
         setup = function()
            require("core.mappings").comment()
         end,
      }

      use {
         "kyazdani42/nvim-tree.lua",
         after = "nvim-web-devicons",
         branch = "feat/open-on-dir",
         cmd = { "NvimTreeToggle", "NvimTreeFocus" },
         config = function()
            require "plugins.configs.nvimtree"
         end,
         setup = function()
            require("core.mappings").nvimtree()
         end,
      }

      use {
         "nvim-telescope/telescope.nvim",
         cmd = "Telescope",
         module = "cheatsheet",
         requires = {
            {
               "nvim-telescope/telescope-fzf-native.nvim",
               run = "make",
            },
            {
               "nvim-telescope/telescope-media-files.nvim",
               setup = function()
                  require("core.mappings").telescope_media()
               end,
            },
            -- {
            --    "sudormrfbin/cheatsheet.nvim",
            --    -- after = "telescope.nvim",
            --    config = function()
            --       require "plugins.configs.chadsheet"
            --    end,
            --    setup = function()
            --       require("core.mappings").chadsheet()
            --    end,
            -- },
         },
         config = function()
            require "plugins.configs.telescope"
         end,
         setup = function()
            require("core.mappings").telescope()
         end,
      }
   end,
   config = {
      git = { clone_timeout = 60, depth = 20 },
      profile = { enable = true, threshold = 1 },
   },
}
