local ok, treesitter_cfg = pcall(require, 'nvim-treesitter.configs')
local ok_1, parser_cfg = pcall(require, 'nvim-treesitter.parsers')
if not ok or not ok_1 then return end

treesitter_cfg.setup {
  auto_install=true,
  ensure_installed={'bash', 'dockerfile', 'go', 'hcl', 'json', 'lua', 'python', 'toml', 'yaml'},
  highlight={enable=true, disable={'c', 'rust'}, additional_vim_regex_highlighting=true},
  ignore_install={'javascript'},
  indent={enable=true},
  matchup={enable=true},
  rainbow={enable=true},
  sync_install=false
}

parser_cfg.get_parser_configs().hcl = {filetype='hcl', 'terraform'}

-- Make sure TS syntax tree is updated when needed by plugin (with some throttling)
-- even if the `highlight` module is not enabled.
-- See https://github.com/nvim-treesitter/nvim-treesitter/issues/2492
-- Found here: https://github.com/wookayin/dotfiles/blob/ffba4c8210826f0993dbeceea13fe53bc9683bf3/nvim/lua/config/treesitter.lua#L62-L98
_G.TreesitterParse = function()
  local lang = parser_cfg.ft_to_lang(vim.bo.filetype)
  local parser = parser_cfg.get_parser(vim.fn.bufnr(), lang)
  if parser then
    return parser:parse()
  else
    return false
  end
end
local function throttle(fn, ms)
  local timer = vim.loop.new_timer()
  local running = false
  return function(...)
    if not running then
      timer:start(ms, 0, function() running = false end)
      running = true
      pcall(vim.schedule_wrap(fn), select(1, ...))
    end
  end
end

if not (treesitter_cfg.get_module('highlight') or {}).enable then
  _G.TreesitterParseDebounce = throttle(_G.TreesitterParse, 100) -- 100 ms
  vim.cmd [[
    augroup TreesitterUpdateParsing
      autocmd!
      autocmd TextChanged,TextChangedI *   call v:lua.TreesitterParseDebounce()
    augroup END
  ]]
end

-- Folding support
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
