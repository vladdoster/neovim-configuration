local bufferline = require "bufferline"

local bar_bg = "#1f1f1f"
local elem_bg = "#2d2d2d"
local elem_fg = "#8c8c8c"
local selected_bg = "#444444"
local selected_fg = "#efefef"
local error_fg = "#ca241a"
local warning_fg = "#fabd2f"
local info_fg = "#83a5cb"
local pick_fg = "#870000"

local colors = {
    bar = { guifg = "#c9c9c9", guibg = bar_bg },
    elem = { guifg = elem_fg, guibg = elem_bg },
    elem_inactive = { guifg = elem_fg, guibg = elem_bg },
    elem_selected = { guifg = selected_fg, guibg = selected_bg },
    separator = { guifg = bar_bg, guibg = elem_bg },
    separator_selected = { guifg = bar_bg, guibg = selected_bg },
    error = { guifg = error_fg, guibg = elem_bg, guisp = error_fg },
    error_selected = { guifg = error_fg, guibg = selected_bg, gui = "" },
    warning = { guifg = warning_fg, guibg = elem_bg, guisp = warning_fg },
    warning_selected = { guifg = warning_fg, guibg = selected_bg, gui = "" },
    info = { guifg = info_fg, guibg = elem_bg, guisp = info_fg },
    info_selected = { guifg = info_fg, guibg = selected_bg, gui = "" },
    pick = { guifg = pick_fg, guibg = elem_bg },
    pick_selected = { guifg = pick_fg, guibg = selected_bg },
}

local diagnostics_signs = {
    ["error"] = "",
    warning = "",
    default = "",
}

bufferline.setup {
    options = {
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = diagnostics_signs[e] or diagnostics_signs.default
                s = s .. (#s > 1 and " " or "") .. sym .. " " .. n
            end
            return s
        end,
        separator_style = "slant",
    },
    highlights = {
        background = colors.elem_inactive,
        buffer_selected = colors.elem_selected,
        buffer_visible = colors.elem_inactive,
        close_button = colors.elem,
        close_button_selected = colors.elem_selected,
        close_button_visible = colors.elem,
        diagnostic = colors.info,
        diagnostic_selected = colors.info_selected,
        duplicate = colors.elem,
        duplicate_selected = colors.elem_selected,
        duplicate_visible = colors.elem,
        error = colors.error,
        error_diagnostic = colors.error,
        error_diagnostic_selected = colors.error_selected,
        error_selected = colors.error_selected,
        fill = colors.bar,
        info = colors.info,
        info_diagnostic = colors.info,
        info_diagnostic_selected = colors.info_selected,
        info_selected = colors.info_selected,
        modified = colors.elem,
        modified_selected = colors.elem_selected,
        modified_visible = colors.elem,
        pick = colors.pick,
        pick_selected = colors.pick_selected,
        separator = colors.separator,
        separator_selected = colors.separator_selected,
        separator_visible = colors.separator,
        tab = colors.elem,
        tab_close = colors.bar,
        tab_selected = colors.elem_selected,
        warning = colors.warning,
        warning_diagnostic = colors.warning,
        warning_diagnostic_selected = colors.warning_selected,
        warning_selected = colors.warning_selected,
    },
}

local map_key = vim.api.nvim_set_keymap
local function map(modes, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    if type(modes) == "string" then
        modes = { modes }
    end
    for _, mode in ipairs(modes) do
        map_key(mode, lhs, rhs, opts)
    end
end

local opts = { silent = true, nowait = true }
map("n", "<leader>gb", ":BufferLinePick<cr>", opts)
map("n", "<leader>d", "<cmd>bdelete!<cr>", opts)
