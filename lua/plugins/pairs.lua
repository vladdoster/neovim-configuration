local autopairs_status_ok, auto_pairs = pcall(require, "nvim-autopairs")
if not autopairs_status_ok then return end
auto_pairs.setup {
    check_ts = true,
    ts_config = {lua = {"string", "source"}, java = false},
    disable_filetype = {"TelescopePrompt", "spectre_panel"},
    fast_wrap = {
        chars = {"{", "[", "(", '"', "'"},
        check_comma = true,
        end_key = "$",
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        map = "<M-e>",
        offset = 0,
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", "")
    }
}
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end
cmp.event:on("confirm_done",
             cmp_autopairs.on_confirm_done {map_char = {tex = ""}})
