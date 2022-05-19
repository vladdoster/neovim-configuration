local M = {}
function M.openDirectory(path)
  require'Telescope.builtin'.git_files {
    cwd=path,
    height=10,
    layout_options={preview_width=0.75},
    layout_strategy='horizontal',
    prompt='ᐳ ',
    shorten_path=true
  }
end
return M

-- vim:ft=lua:sw=2:sts=2:et:foldmarker=function,end:foldmethod=marker
