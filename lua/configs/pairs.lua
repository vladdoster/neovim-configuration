local autopairs_loaded, auto_pairs = pcall(require, 'nvim-autopairs')
if not autopairs_loaded then return end
require('nvim-autopairs').setup()
require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
