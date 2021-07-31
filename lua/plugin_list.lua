local present, _ = pcall(require, "bootstrap_packer")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

local function conf(name)
    return ([[require('plugins.config').%s()]]):format(name)
end

local function module(name)
    return ([[require('plugins.%s')]]):format(name)
end

return packer.startup(function()
    use {"wbthomason/packer.nvim", event = "VimEnter"}

    use {
        'marko-cerovac/material.nvim',
        config = conf("colorscheme")
    }
    use {"kyazdani42/nvim-web-devicons"}
    use {
        "akinsho/nvim-bufferline.lua",
        config = module("bufferline")
    }
    use {
        "glepnir/galaxyline.nvim",
        config = module("statusline")
    }

    use {'kevinhwang91/rnvimr', config = conf('rnvimr')}

    use {"nvim-lua/plenary.nvim"}
    use {"nvim-lua/popup.nvim"}

    use {
        'tpope/vim-surround',
        setup = [[vim.g.surround_no_mappings = 1]],
        keys = {
            {'n', 'sd'}, {'n', 'cs'}, {'n', 'cS'}, {'n', 'ys'}, {'n', 'yS'},
            {'n', 'yss'}, {'n', 'ygs'}, {'x', 'S'}, {'x', 'gS'}
        },
        config = conf('surround')
    }

    use {'andymass/vim-matchup', config = conf('matchup')}
    use {'sbdchd/neoformat', cmd = 'Neoformat', config = conf('neoformat')}
    use {'tpope/vim-repeat', opt = false}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}

    use {"kabouzeid/nvim-lspinstall", event = "BufRead"}
    use {
        "neovim/nvim-lspconfig",
        after = "nvim-lspinstall",
        config = module("lspconfig")
    }
    use {
        "onsails/lspkind-nvim",
        after = "nvim-lspinstall",
        event = "BufRead",
        config = conf('lspkind'),
    }
    use { "ray-x/lsp_signature.nvim" }

    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = module("compe"),
        wants = "LuaSnip",
        requires = {
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = module("luasnip"),
            }, {"rafamadriz/friendly-snippets", event = "InsertCharPre"}
        }
    }


end)
