local M = {}
local cmd = vim.cmd

local g = vim.g

local map = require("remap").map

function M.colorscheme()
    vim.g.material_style = "darker"
    require("material").set()
end

function M.bqf()
    if g.colors_name == "one" then cmd("hi! link BqfPreviewBorder Parameter") end

    require("bqf").setup({
        auto_enable = true,
        auto_resize_height = true,
        preview = {auto_preview = true},
        func_map = {split = "<C-s>"},
        filter = {fzf = {action_for = {["ctrl-s"] = "split"}}}
    })
end

function M.surround()
    map("n", "sd", "<Plug>Dsurround", {})
    map("n", "cs", "<Plug>Csurround", {})
    map("n", "cS", "<Plug>CSurround", {})
    map("n", "ys", "<Plug>Ysurround", {})
    map("n", "yS", "<Plug>YSurround", {})
    map("n", "yss", "<Plug>Yssurround", {})
    map("n", "ygs", "<Plug>YSsurround", {})
    map("x", "S", "<Plug>VSurround", {})
    map("x", "gS", "<Plug>VgSurround", {})
end

function M.lspkind()
    local present, lspkind = pcall(require, "lspkind")
    if present then lspkind.init() end
end

function M.matchup()
    g.matchup_surround_enabled = 1
    g.matchup_matchparen_timeout = 100
    g.matchup_matchparen_deferred = 1
    g.matchup_matchparen_deferred_show_delay = 50
    g.matchup_matchparen_deferred_hide_delay = 300
    g.matchup_matchparen_hi_surround_always = 2
    g.matchup_matchparen_offscreen = {
        method = "popup",
        highlight = "CurrentWord"
    }
    g.matchup_delim_start_plaintext = 1
    g.matchup_motion_override_Npercent = 0
    g.matchup_motion_cursor_end = 0
    g.matchup_mappings_enabled = 0

    cmd("hi! link MatchWord Underlined")

    map("n", "%", "<Plug>(matchup-%)", {})
    map("x", "%", "<Plug>(matchup-%)", {})
    map("o", "%", "<Plug>(matchup-%)", {})
    map("n", "[5", "<Plug>(matchup-[%)", {})
    map("x", "[5", "<Plug>(matchup-[%)", {})
    map("o", "[5", "<Plug>(matchup-[%)", {})
    map("n", "]5", "<Plug>(matchup-]%)", {})
    map("x", "]5", "<Plug>(matchup-]%)", {})
    map("o", "]5", "<Plug>(matchup-]%)", {})
    map("n", "<Leader>5", "<Plug>(matchup-z%)", {})
    map("x", "<Leader>5", "<Plug>(matchup-z%)", {})
    map("o", "<Leader>5", "<Plug>(matchup-z%)", {})
    map("x", "a5", "<Plug>(matchup-a%)", {})
    map("o", "a5", "<Plug>(matchup-a%)", {})
    map("x", "i5", "<Plug>(matchup-i%)", {})
    map("o", "i5", "<Plug>(matchup-i%)", {})
    map("n", "cs5", "<plug>(matchup-cs%)", {})
    map("n", "sd5", "<plug>(matchup-ds%)", {})

    cmd([[
        aug Mathup
            au!
            autocmd TermOpen * let [b:matchup_matchparen_enabled, b:matchup_matchparen_fallback] = [0, 0]
        aug END
    ]])
end

function M.gitgutter()
    cmd([[
        hi! link GitGutterAdd Constant
        hi! link GitGutterChange Type
        hi! link GitGutterDelete Identifier
        hi! link GitGutterAddLineNr GitGutterAdd
        hi! link GitGutterChangeLineNr GitGutterChange
        hi! link GitGutterDeleteLineNr GitGutterDelete
        hi! link GitGutterChangeDeleteLineNr GitGutterChangeDeleteLine
        hi! link GitGutterAddIntraLine DiffText
        hi! link GitGutterDeleteIntraLine DiffText
    ]])
    if g.colors_name == "one" then
        cmd("hi! GitGutterChangeDeleteLine guifg=#be5046")
    end
    map("n", "<Leader>hp", "<Plug>(GitGutterPreviewHunk)", {})
    map("n", "<Leader>hs", "<Plug>(GitGutterStageHunk)", {})
    map("n", "<Leader>hu", "<Plug>(GitGutterUndoHunk)", {})
    map("n", "[c", "<Plug>(GitGutterPrevHunk)", {})
    map("n", "]c", "<Plug>(GitGutterNextHunk)", {})
    map("o", "ih", "<Plug>(GitGutterTextObjectInnerPending)", {})
    map("o", "ah", "<Plug>(GitGutterTextObjectOuterPending)", {})
    map("x", "ih", "<Plug>(GitGutterTextObjectInnerVisual)", {})
    map("x", "ah", "<Plug>(GitGutterTextObjectOuterVisual)", {})
end

function M.file_tree()
    vim.g.rnvimr_ex_enable = 1
    vim.g.rnvimr_draw_border = 1
    vim.g.rnvimr_pick_enable = 1
    vim.g.rnvimr_bw_enable = 1
    vim.cmd("nmap <leader>r :RnvimrToggle<CR>")
end

function M.rnvimr()
    vim.g.rnvimr_ex_enable = 1
    vim.g.rnvimr_draw_border = 1
    vim.g.rnvimr_pick_enable = 1
    vim.g.rnvimr_bw_enable = 1
    vim.cmd("nmap <leader>r :RnvimrToggle<CR>")
end

function M.neoformat()
    g.neoformat_only_msg_on_error = 1
    g.neoformat_basic_format_align = 1
    g.neoformat_basic_format_retab = 1
    g.neoformat_basic_format_trim = 1

    g.neoformat_enabled_javascript = {"prettier"}
    g.neoformat_enabled_json = {"prettier"}
    g.neoformat_enabled_lua = {"luaformat"}
    g.neoformat_enabled_python = {"autopep8"}
    g.neoformat_enabled_yaml = {"prettier"}

    g.neoformat_lua_luaformat = {exe = "lua-format"}
    g.neoformat_python_autopep8 = {
        exe = "autopep8",
        args = {"--max-line-length=100"}
    }
    g.neoformat_yaml_prettier = {
        exe = "prettier",
        args = {"--stdin-filepath", '"%:p"', "--tab-width=2"},
        stdin = 1
    }
end

function M.suda() map("n", "<Leader>W", "<Cmd>SudaWrite<CR>") end

return M
