local status_ok, comment = pcall(require, 'Comment')
if not status_ok then return end
comment.setup()

local file_type = require('Comment.ft')

file_type.set('yaml', '#%s')
file_type.set('javascript', {'//%s', '/*%s*/'}).set('conf', '#%s')
-- Metatable magic
file_type.javascript = {'//%s', '/*%s*/'}
file_type.yaml = '#%s'
-- Multiple filetypes
file_type({'go', 'rust'}, {'//%s', '/*%s*/'})
file_type({'toml', 'graphql', 'bash', 'zsh'}, '#%s')
