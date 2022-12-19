# Neovim configuration
[![Release Version](https://img.shields.io/github/v/release/vladdoster/neovim-configuration)](https://github.com/vladdoster/neovim-configuration/releases/latest)
[![Release Status](https://img.shields.io/github/workflow/status/vladdoster/neovim-configuration/Release?label=build)](https://github.com/vladdoster/neovim-configuration/actions/workflows/release.yml)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/m/vladdoster/neovim-configuration)](https://github.com/vladdoster/neovim-configuration/graphs/contributors)

## Makefile

| Target        | Descripton                                                 |
| ------------- | ---------------------------------------------------------- |
| clean         | Remove installed plugins & packer artifacts                |
| deps          | Install lua-formatter system-wide                          |
| format        | Run lua-formatter using .lua_format.yml config             |
| help          | Display all Makfile targets                                |
| update-readme | Update Make targets table in README                        |
| update        | Run clean target, pull git changes, and re-install plugins |
