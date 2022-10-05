local ok, comment = pcall(require, 'Comment')
if not ok then return end
comment.setup({ignore='^$'})

local file_type = require('Comment.ft')
file_type({'bash', 'markdown', 'sh', 'yaml', 'zsh'}, '# %s') -- Metatable magic
