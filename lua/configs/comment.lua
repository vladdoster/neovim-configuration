local status_ok, comment = pcall(require, 'Comment')
if not status_ok then return end
comment.setup()
local file_type = require('Comment.ft')
-- Metatable magic
file_type({'bash', 'markdown', 'sh', 'yaml', 'zsh'}, '# %s')
