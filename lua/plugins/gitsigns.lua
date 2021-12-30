local present, gitsigns = pcall(require, 'gitsigns')
if not present then return end
require('gitsigns').setup {
    signs={
        add={hl='GitGutterAdd', text='+'},
        change={hl='GitGutterChange', text='~'},
        delete={hl='GitGutterDelete', text='_'},
        topdelete={hl='GitGutterDelete', text='‾'},
        changedelete={hl='GitGutterChange', text='~'}
    },
    watch_index={interval=100}
}
