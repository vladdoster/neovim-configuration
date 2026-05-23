# Neovim configuration

[![Release Version](https://img.shields.io/github/v/release/vladdoster/neovim-configuration)](https://github.com/vladdoster/neovim-configuration/releases/latest)
[![Release](https://github.com/vladdoster/neovim-configuration/actions/workflows/release.yml/badge.svg)](https://github.com/vladdoster/neovim-configuration/actions/workflows/release.yml)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/m/vladdoster/neovim-configuration)](https://github.com/vladdoster/neovim-configuration/graphs/contributors)

## Install

Requires **Neovim ≥ 0.12** (uses the built-in `vim.pack` plugin manager).

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

```bash
git clone https://github.com/vladdoster/neovim-configuration ~/.config/nvim
```

```bash
make clean
nvim
```

## Plugin management

Plugins are managed by the built-in `vim.pack` (Neovim 0.12+). Revisions are
pinned in `nvim-pack-lock.json`.

| Command            | Description                                                   |
| ------------------ | ------------------------------------------------------------- |
| `:PackUpdate`      | Update all packages (opens the built-in confirmation buffer). |
| `:PackClean`       | Remove plugins no longer listed in the orchestrator.          |
| `:PackStatus`      | Print installed plugin status.                                |
| `:PackLockWrite`   | Capture current installed revisions into the lockfile.        |
| `:PackLockRestore` | Roll back to the revisions in the lockfile.                   |
| `:PackSync`        | `update` → `clean` → `lock write`.                            |

After running an update, run `:PackLockWrite` to refresh
`nvim-pack-lock.json`.

## Makefile

| Target        | Descripton                                                 |
| ------------- | ---------------------------------------------------------- |
| clean         | Remove installed plugins & packer artifacts                |
| deps          | Install lua-formatter system-wide                          |
| format        | Run lua-formatter using `.lua_format.yml` config            |
| help          | Display all Makfile targets                                |
| update-readme | Update Make targets table in README                        |
| update        | Run clean target, pull git changes, and re-install plugins |
