# Neovim configuration

|                                version                                |
| :-------------------------------------------------------------------: |
| [v4.4.0](https://github.com/vladdoster/neovim-configuration/releases) |

## Makefile

| Target | Description                                             |
| :----: | ------------------------------------------------------- |
| clean  | remove installed plugins & packer artifacts             |
|  deps  | install lua-formatter system-wide                       |
| format | run lua-formatter using .lua_format.yml config          |
|  help  | Display all Makfile targets                             |
| update | run clean target, pull git changes, and install plugins |
