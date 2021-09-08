local M = {}

M.autopairs = function()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, autopairs_completion = pcall(require, "nvim-autopairs.completion.cmp")

    if not (present1 or present2) then
        return
    end

    autopairs.setup()
    autopairs_completion.setup {
        map_complete = true, -- insert () func completion
        map_cr = true,
    }
end

M.better_escape = function()
    local present, _ = pcall(require, "better_escape")
    if present then
        vim.g.better_escape_interval = 300
    end
end

M.blankline = function()
    local present, indent_blankline = pcall(require, "indent_blankline")
    if present then
        indent_blankline.setup {
            indentLine_enabled = 1,
            char = "▏",
            filetype_exclude = {
                "help",
                "terminal",
                "packer",
                "lspinfo",
                "TelescopePrompt",
                "TelescopeResults",
            },
            buftype_exclude = { "terminal" },
            show_trailing_blankline_indent = false,
            show_first_indent_level = false,
        }
    end
end

M.comment = function()
    local present, nvim_comment = pcall(require, "nvim_comment")
    if present then
        nvim_comment.setup()
    end
end

M.luasnip = function()
    local present, luasnip = pcall(require, "luasnip")
    if not present then
        return
    end

    luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
    }
    require("luasnip/loaders/from_vscode").load()
end

M.material = function()
    local present, material = pcall(require, "material")
    if present then
        material.setup()
        vim.g.material_style = "darker"
        vim.cmd [[colorscheme material]]
    end
end

M.signature = function()
    local present, lspsignature = pcall(require, "lsp_signature")
    if present then
        lspsignature.setup {
            bind = true,
            doc_lines = 2,
            floating_window = true,
            fix_pos = true,
            hint_enable = true,
            hint_prefix = " ",
            hint_scheme = "String",
            hi_parameter = "Search",
            max_height = 22,
            max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
            handler_opts = { border = "single" },
            zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
            padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
        }
    end
end

return M
