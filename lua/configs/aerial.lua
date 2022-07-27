local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then return end
aerial.setup({
  backends={'lsp', 'treesitter', 'markdown'},
  close_behavior='global',
  filter_kind=false,
  min_width=40,
  show_guides=true,
  icons={
    Array='arr',
    Boolean='bool',
    Class='class',
    Constant='const',
    Constructor='constructor',
    Enum='enum',
    EnumMember='enum member',
    Event='event',
    Field='field',
    File='file',
    Function='func',
    Interface='interface',
    Key='key',
    Method='method',
    Module='module',
    Namespace='namespace',
    Null='null',
    Number='num',
    Object='obj',
    Operator='operator',
    Package='pkg',
    Property='prop',
    String='str',
    Struct='struct',
    TypeParameter='type',
    Variable='var'
  },
  guides={last_item='└ ', mid_item='├ ', nested_top='│ ', whitespace='  '}
})
