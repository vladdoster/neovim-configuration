local M = {}

M.autopairs = function()
    local is_ok_0, autopairs = pcall(require, "nvim-autopairs")
    local is_ok_1, autopairs_completion = pcall(require, "nvim-autopairs.completion.cmp")

    if not (is_ok_0 or is_ok_1) then
        return
    end

    autopairs.setup()
    autopairs_completion.setup {
        map_complete = true,
        map_cr = true,
    }
end

M.luasnip = function()
    local is_ok, luasnip = pcall(require, "luasnip")
    if not is_ok then
        return
    end

    luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
    }
    require("luasnip/loaders/from_vscode").load()
end

M.material = function()
    local is_ok, material = pcall(require, "material")
    if not is_ok then
        return
    end

    -- material.setup()
    vim.g.material_style = "darker"
    vim.cmd [[colorscheme material]]
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
            zindex = 50, -- by default it will be on top of all floating windows, set to 50 send it to bottom
            padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
        }
    end
end

return M
