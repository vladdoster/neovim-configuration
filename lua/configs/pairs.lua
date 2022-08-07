local npairs_ok, npairs = pcall(require, 'nvim-autopairs')
local cmp_ok, cmp = pcall(require, 'cmp')
if not npairs_ok or not cmp_ok then return end
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done {map_char={tex=''}})
npairs.setup {check_ts=true, fast_wrap={}}
