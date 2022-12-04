local ok, aerial = pcall(require, 'aerial')
if not ok then return end
aerial.setup {
  attach_mode='global',
  backends={'lsp', 'treesitter', 'markdown', 'man'},
  filter_kind=false,
  guides={last_item='└ ', mid_item='├ ', nested_top='│ ', whitespace='  '},
  keymaps={
    ['[Y']='actions.prev_up',
    ['[[']=false,
    ['[y']='actions.prev',
    [']Y']='actions.next_up',
    [']]']=false,
    [']y']='actions.next',
    ['{']=false,
    ['}']=false
  },
  layout={default_direction='right', min_width=28, placement='edge'},
  show_guides=true
}
