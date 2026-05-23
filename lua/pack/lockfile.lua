-- Lockfile workflow.
--
-- vim.pack natively manages a JSON lockfile at:
--   $XDG_CONFIG_HOME/nvim/nvim-pack-lock.json
--
-- Format (see |vim.pack-lockfile|):
--   { "plugins": { "<name>": { "rev": "<sha>", "src": "<url>" }, ... } }
--
-- On the very first `vim.pack` call of a session, if the lockfile is present,
-- vim.pack installs each plugin at the recorded revision instead of inferring
-- one from `spec.version`. The lockfile is also updated automatically after
-- install/update/delete. Per `:h vim.pack-lockfile` it should be committed to
-- version control for a robust config.
--
-- This module exposes thin helpers around that built-in workflow:
--   * `path()`        - absolute path to the lockfile
--   * `write()`       - force a refresh of the lockfile by triggering a no-op
--                       vim.pack.update so vim.pack rewrites it on disk
--   * `restore()`     - re-apply revisions from the lockfile to installed
--                       plugins (uses vim.pack.update under the hood)

local M = {}

local uv = vim.uv or vim.loop

function M.path() return vim.fn.stdpath('config') .. '/nvim-pack-lock.json' end

--- Trigger vim.pack to rewrite its lockfile by running an offline update.
--- The offline update walks installed plugins and refreshes the on-disk
--- lockfile entries without touching the network.
function M.write()
  local ok, err = pcall(vim.pack.update, nil, { offline = true })
  if not ok then
    vim.notify('PackLockWrite: ' .. tostring(err), vim.log.levels.ERROR)
    return
  end
  vim.notify('PackLockWrite: lockfile refreshed at ' .. M.path())
end

--- Re-install/update each plugin to the revision recorded in the lockfile.
--- Useful after editing the lockfile by hand or to roll back.
function M.restore()
  local path = M.path()
  if not uv.fs_stat(path) then
    vim.notify('PackLockRestore: lockfile is missing: ' .. path, vim.log.levels.WARN)
    return
  end
  -- vim.pack reads the lockfile on its first call of the session; the safest
  -- way to "apply" it is to ask vim.pack to update everything offline, which
  -- will re-checkout the revision the lockfile records.
  local names = {}
  for _, item in ipairs(vim.pack.get()) do
    if item.spec and item.spec.name then table.insert(names, item.spec.name) end
  end
  if #names == 0 then
    vim.notify('PackLockRestore: no installed plugins to restore', vim.log.levels.WARN)
    return
  end
  vim.pack.update(names, { force = true })
  vim.notify(string.format('PackLockRestore: restored %d plugins from %s', #names, path))
end

return M
