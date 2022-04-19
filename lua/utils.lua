local M = {}
function M.openDirectory(path)
  require'telescope.builtin'.git_files {
    shorten_path=true,
    cwd=path,
    prompt='ᐳ ',
    height=10,
    layout_strategy='horizontal',
    layout_options={preview_width=0.75}
  }
end
return M
-- vim:ft=lua:sw=4:sts=4:et:foldmarker={{{,}}}:foldmethod=marker
