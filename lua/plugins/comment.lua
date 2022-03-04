local status_ok, comment = pcall(require, 'Comment')
if not status_ok then return end
comment.setup({
  active = true,
  on_config_done = nil,
  padding = true,
  ignore = '^$',
  mappings = {
    basic = true, ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
    extra = false ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
  },
  toggler = {line = 'gcc', block = 'gbc'},
  opleader = {line = 'gc', block = 'gb'},
  pre_hook = nil,
  post_hook = nil
})
