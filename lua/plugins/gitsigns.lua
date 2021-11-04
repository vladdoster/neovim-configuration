local present, gitsigns = pcall(require, 'gitsigns')
if not present then return end

gitsigns.setup {
    signs={add={text='+'}, change={text='~'}, changedelete={text='='}},
    watch_index={interval=100}
}
