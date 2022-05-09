local actions = require 'telescope.actions'
local trouble = require 'trouble.providers.telescope'
local telescope = require 'telescope'

telescope.setup {
  extensions = { fzy_native = { override_generic_sorter = false, override_file_sorter = true } },
  defaults = {
    -- mappings = { i = { ["<c-t>"] = trouble.open_with_trouble } },
    mappings = { i = { ['<esc>'] = actions.close } },
    prompt_prefix = 'ᐳ ',
    selection_caret = '• ',
    shorten_path = true,
    winblend = 10,
    -- width = 0.7,
    preview_cutoff = 200,
    border = {},
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
    results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
    preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    color_devicons = false,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
  },
}

telescope.load_extension 'fzy_native'
telescope.load_extension 'z'

local M = {}

M.project_files = function(opts)
  opts = opts or {}

  local _git_pwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]

  if vim.v.shell_error ~= 0 then
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require('telescope.builtin').find_files(opts)
    return
  end

  require('telescope.builtin').git_files(opts)
end

local util = require 'util'

util.nnoremap('<Leader><Space>', M.project_files)
util.nnoremap('<Leader>fd', function()
  require('telescope.builtin').git_files { cwd = '~/dot' }
end)

util.nnoremap('<leader>fz', function()
  require('telescope').extensions.z.list { cmd = { vim.o.shell, '-c', 'zoxide query -ls' } }
end)

util.nnoremap('<leader>pp', ':lua require\'telescope\'.extensions.project.project{}<CR>')

return M
