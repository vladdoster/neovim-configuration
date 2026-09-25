return {
  {
    'sQVe/sort.nvim',
    -- VeryLazy, not just `cmd = 'Sort'`: setup() also registers the plugin's own
    -- `go` operator, `is`/`as` textobjects and `]s`/`[s` motions, which a command
    -- trigger would leave dead until the first :Sort. Note `]s`/`[s` shadow the
    -- built-in next/prev-misspelled-word motions.
    event = 'VeryLazy',
    opts = {},
  },
}
-- vim: ts=2 sts=2 sw=2 et
