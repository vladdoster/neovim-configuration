# Neovim configuration

|                                Version                                |
| :-------------------------------------------------------------------: |
| [v6.3.1](https://github.com/vladdoster/neovim-configuration/releases) |

## Makefile

| Target | Description                                                |
| :----: | ---------------------------------------------------------- |
| clean  | Remove installed plugins & packer artifacts                |
|  deps  | Install lua-formatter system-wide                          |
| format | Run lua-formatter using `.lua_format.yml` config           |
|  help  | Display all Makfile targets                                |
| update | Run clean target, pull git changes, and re-install plugins |
