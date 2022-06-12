local autopairs_loaded, auto_pairs = pcall(require, 'nvim-autopairs')
local cmp_loaded, cmp = pcall(require, 'nvim-cmp')
if not autopairs_loaded or not cmp_loaded then return end
auto_pairs.setup()
cmp.event.on({'confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done()})
