local ok, fidget = pcall(require, 'fidget')
if not ok then return end

fidget.setup {text={done=''}, window={relative='win', blend=100, zindex=nil}}
