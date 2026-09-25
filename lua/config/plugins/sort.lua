return {
  {
    'sQVe/sort.nvim',
    -- VeryLazy, not `cmd = 'Sort'`: setup() also maps the operator, textobjects and motions.
    -- These keys keep the built-in `go`, `is`/`as` and `]s`/`[s` (next/prev misspelled word).
    event = 'VeryLazy',
    opts = {
      mappings = {
        operator = 'gS',
        textobject = { inner = 'iS', around = 'aS' },
        motion = { next_delimiter = '],', prev_delimiter = '[,' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
