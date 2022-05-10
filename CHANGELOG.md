# [1.27.0](https://github.com/vladdoster/neovim-configuration/compare/v1.26.0...v1.27.0) (2022-05-10)


### feat

* add easy-align, sort-folds, surround, and sort plugins ([a2545e9](https://github.com/vladdoster/neovim-configuration/commit/a2545e9640b471e730a1f59a1411d95ae59dcf83))

### maint

* add sessions dir to gitignore ([b292532](https://github.com/vladdoster/neovim-configuration/commit/b292532c2d53587733e02dced95067b8741b84bf))
* clean up whichkey config ([c53fe10](https://github.com/vladdoster/neovim-configuration/commit/c53fe10df6c1748d952b0d1a3adfe6f5bdf4cacc))
* remove commented out config code from telescope ([f769b83](https://github.com/vladdoster/neovim-configuration/commit/f769b8319224dc02ff93e1a9bfdfd7146edc800c))
* remove unused languages from treesitter ([53f78e7](https://github.com/vladdoster/neovim-configuration/commit/53f78e7af99f41eeb41ce42f2bb2d69c368b348c))
* update key mappings ([83a46e0](https://github.com/vladdoster/neovim-configuration/commit/83a46e07132f730c6bfce5551d3df49aa03bbb06))

### style

* remove lualine seperators ([1225e14](https://github.com/vladdoster/neovim-configuration/commit/1225e1413e4bb6a0c519c8b1732c567b348fa111))

# [1.26.0](https://github.com/vladdoster/neovim-configuration/compare/v1.25.1...v1.26.0) (2022-05-09)


### feat

* add b0o/incline plugin ([7254e30](https://github.com/vladdoster/neovim-configuration/commit/7254e308c8df99f4c3a23bcdd2c360c1d81579d0))

### maint

* update neotree, keybinds, plugins, and lsp configs ([8e0c76f](https://github.com/vladdoster/neovim-configuration/commit/8e0c76f4b5dafcb4ea44d468e46dfc9cedbe2b11))

### new

* overhaul configuration (#1) ([3297b17](https://github.com/vladdoster/neovim-configuration/commit/3297b17d0a9d38da8566ef226d8b2ea4c9b7cb3e)), closes [#1](https://github.com/vladdoster/neovim-configuration/issues/1)

## [1.25.1](https://github.com/vladdoster/neovim-configuration/compare/v1.25.0...v1.25.1) (2022-05-05)


### fix

* update configs to use updated v0.7.0 API ([8c36612](https://github.com/vladdoster/neovim-configuration/commit/8c36612a042d9bb8cc041548837656ce05c80e6f))

### maint

* fix keybinds and switch back to nvim-tree ([326c9d2](https://github.com/vladdoster/neovim-configuration/commit/326c9d2f4210d326b61447aa7f0edcfb7bfbf243))
* use esc to stop search hl & remove ex removal ([2298650](https://github.com/vladdoster/neovim-configuration/commit/22986507b6e9d050bf0f0105ae4de40ba376755e))

### style

* fix indenting for plugins.lua ([6afbae0](https://github.com/vladdoster/neovim-configuration/commit/6afbae03e512ccfff7d3845fbe7aa91959d9454e))

# [1.25.0](https://github.com/vladdoster/neovim-configuration/compare/v1.24.0...v1.25.0) (2022-04-24)


### fix

* comment-box sizing and location ([19e72b4](https://github.com/vladdoster/neovim-configuration/commit/19e72b494f475c9ebca050b0d11c990a10a7f3bf))

### maint

* misc neo-tree config update ([84a158a](https://github.com/vladdoster/neovim-configuration/commit/84a158a10fed49931665820d4e7bd84773ef3b2d))
* remove folds and add various keybinds & comment-box ([7e3eb8a](https://github.com/vladdoster/neovim-configuration/commit/7e3eb8a1bca0c4e7dbd3a5ebe62b8636bdbe1dfc))
* remove python3 prog host variable" ([de1d9d0](https://github.com/vladdoster/neovim-configuration/commit/de1d9d09a304345f8dcaffed0bf656834d1cfe16))

### new

* add 'update' Make target to pull upstream changes ([9d930c1](https://github.com/vladdoster/neovim-configuration/commit/9d930c1dc9841780b70fb1b3b56cd10c5addf144))
* add b0o/mapx for more ergonomic keymaps ([b84d488](https://github.com/vladdoster/neovim-configuration/commit/b84d488d3c98f5202370f5e1380b1a5c78a94086))
* add substitute shortcut keybind "<leader>/" ([2160f89](https://github.com/vladdoster/neovim-configuration/commit/2160f892ba999c535eda395f0982cbcc1b1c07af))

### style

* add folds and sort ([8262cb2](https://github.com/vladdoster/neovim-configuration/commit/8262cb2d83e5ddca18aeabc6ae0f56e87cb3f467))
* remove blank lines from color-scheme.lua ([e20b7cc](https://github.com/vladdoster/neovim-configuration/commit/e20b7cc7d918cfa6bad0587f2463669587c5bca9))
* remove git status & increase width for neo-tree ([be57dcb](https://github.com/vladdoster/neovim-configuration/commit/be57dcbdcf5fe70678acbfd8c4116af7aa68c3a4))

# [1.24.0](https://github.com/vladdoster/neovim-configuration/compare/v1.23.0...v1.24.0) (2022-04-21)


### feat

* add comment-box plugin ([afbadbf](https://github.com/vladdoster/neovim-configuration/commit/afbadbf1c9c3b9186f8ca723d3866dac8535edb5))
* add unit tests ([2a03ab0](https://github.com/vladdoster/neovim-configuration/commit/2a03ab077dfe4e470e10268e4e2efc71ab550ac0))

### fix

* change packer option from `require` to `wants` for plugin dependencies ([4ad45fe](https://github.com/vladdoster/neovim-configuration/commit/4ad45febeb414de228b8552ae85e412306e5233d))
* packer sync on every BufEnter ([8e3a6f0](https://github.com/vladdoster/neovim-configuration/commit/8e3a6f0c79faaf229290d2655f8f93263793cacd))
* partially fix telescope loading ([d8b9660](https://github.com/vladdoster/neovim-configuration/commit/d8b9660f0dbace6a3ca29e831eb662d60ebad061))

### maint

* add vim modeline settings and fix loading of Telescope ([55d2fd6](https://github.com/vladdoster/neovim-configuration/commit/55d2fd62ecd26df369f7d8946d19189fec7ad1db))
* clean up Makefile ([208a58e](https://github.com/vladdoster/neovim-configuration/commit/208a58edad071d0e79a8747dcfdce2a453a10b2a))

### new

* add .editorconfig ([9ff64b8](https://github.com/vladdoster/neovim-configuration/commit/9ff64b86b1e9235aa6914017629be36858ec26b8))

### style

* remove outermost fold around vim modes ([1f6ed45](https://github.com/vladdoster/neovim-configuration/commit/1f6ed45a65d84553a1ab766a91b81b28da1df83b))

# [1.23.0](https://github.com/vladdoster/neovim-configuration/compare/v1.22.1...v1.23.0) (2022-04-19)


### maint

* condense plugins to improve performance ([2436430](https://github.com/vladdoster/neovim-configuration/commit/2436430d237f46a346906491072f3d79fe6301b9))
* update configs for v0.7.0 and telescope config ([9d162d0](https://github.com/vladdoster/neovim-configuration/commit/9d162d0adf45e0c5acfa99da44dd7d654fd0afc5))

### style

* revert lualine change and fmt ([b0474a7](https://github.com/vladdoster/neovim-configuration/commit/b0474a7ffdef144e40645fd4be63f54ea94e5f0c))

### update

* colorscheme, telescope, keymap, & settings ([68edc3d](https://github.com/vladdoster/neovim-configuration/commit/68edc3d7451f3aca472938d744a5deec250625ef))

## [1.22.1](https://github.com/vladdoster/neovim-configuration/compare/v1.22.0...v1.22.1) (2022-04-17)


### fix

* neovim v.0.7.0 breaking changes ([57d63fd](https://github.com/vladdoster/neovim-configuration/commit/57d63fd771f4dec0038568e7fb742b7f5b1e1cb5))
* telescope config ([09a17b2](https://github.com/vladdoster/neovim-configuration/commit/09a17b20dd4ad47527389b190f7915906fc0513c))

### maint

* add folds to keybinds ([e164281](https://github.com/vladdoster/neovim-configuration/commit/e164281187a63e2ff9f4b8a0e9521998629545f1))
* add remember plugin ([9e6f070](https://github.com/vladdoster/neovim-configuration/commit/9e6f070c64387337f46b9fa31873fa88db031945))
* fix ToggleTerm and NeoTree keymappings ([03760fc](https://github.com/vladdoster/neovim-configuration/commit/03760fc72336d560e9b1ad755b83b6aee340f54f))

# [1.22.0](https://github.com/vladdoster/neovim-configuration/compare/v1.21.0...v1.22.0) (2022-04-12)


### feat

* correct cmp module ([5dab656](https://github.com/vladdoster/neovim-configuration/commit/5dab6560b6397e6b82d1cc96afb51271aa5dc2ef))
* correct lualine, notify, telescope, toggleterm, and treesitter configs ([606b24e](https://github.com/vladdoster/neovim-configuration/commit/606b24ebb0b6291175aab419ca4ce4982d621616))
* update cmp capabilities ([cfd65b1](https://github.com/vladdoster/neovim-configuration/commit/cfd65b1fddb400be38a1026c6e67214084b0f686))
* update modules ([977d025](https://github.com/vladdoster/neovim-configuration/commit/977d025711ca8e3fdc0104a15db31a44117c0d0c))
* update neo-tree git icons & keymaps ([3965aef](https://github.com/vladdoster/neovim-configuration/commit/3965aefa33ce505e463bcf59c4c92f97fbeff833))

# [1.21.0](https://github.com/vladdoster/neovim-configuration/compare/v1.20.0...v1.21.0) (2022-04-11)


### feat

* break out lsp cmp handlers config ([fc677f2](https://github.com/vladdoster/neovim-configuration/commit/fc677f2a404f0312987789c0a938ee2d79082155))
* update modules ([69bb4cf](https://github.com/vladdoster/neovim-configuration/commit/69bb4cf54bd6d8a8b436d1db3d07a18d84e9123d))
* update modules ([70fc38d](https://github.com/vladdoster/neovim-configuration/commit/70fc38da85be26cd14dcf3dd71eb70241614eb4e))

### style

* adjust stylua line length ([fde0eac](https://github.com/vladdoster/neovim-configuration/commit/fde0eacfbe75e419544ae6eea62070071375d7b6))
* adjust stylua line length ([65fd8b5](https://github.com/vladdoster/neovim-configuration/commit/65fd8b5598abb6935339e513487463322af7b46b))

# [1.20.0](https://github.com/vladdoster/neovim-configuration/compare/v1.19.0...v1.20.0) (2022-04-09)


### style

* format notify, nvim-tree, and toggleterm config ([77ea55f](https://github.com/vladdoster/neovim-configuration/commit/77ea55f4be4a0b0662243796979a76de13fb3a95))

### update

* flesh out treesitter configuration ([f08ac1d](https://github.com/vladdoster/neovim-configuration/commit/f08ac1d3a62852e3e890a047f31cfc7eba41f4f4))

# [1.19.0](https://github.com/vladdoster/neovim-configuration/compare/v1.18.0...v1.19.0) (2022-04-07)


### style

* format telescope config ([b1a8867](https://github.com/vladdoster/neovim-configuration/commit/b1a8867e052bc328619957c4dc6c11baf331617b))

### update

* flesh out `gitsigns` functionality ([123cb26](https://github.com/vladdoster/neovim-configuration/commit/123cb265420246cca5ba42decfd17ec0afd53ae0))

# [1.18.0](https://github.com/vladdoster/neovim-configuration/compare/v1.17.0...v1.18.0) (2022-04-04)


### feat

* add dressing plugin for nicer ui components ([b7b8cc8](https://github.com/vladdoster/neovim-configuration/commit/b7b8cc8a89ab7798974f8919754698e2c99811b0))
* add trouble, fmt via stylua, keymap refactor ([c4df89a](https://github.com/vladdoster/neovim-configuration/commit/c4df89a55f0a0411b863e4406ac3fda8565fd293))
* switch to stylua formatter ([8bcb9cd](https://github.com/vladdoster/neovim-configuration/commit/8bcb9cda1167e1a8044c99ce1221d9fb29f5c14e))

### maint

* improved toggleterm user experience ([fab2cd9](https://github.com/vladdoster/neovim-configuration/commit/fab2cd9a1de6436f7d9db2316ada6fd670657d67))
* rename plugins dir to remove conflict with plugins.lua ([a05e6e4](https://github.com/vladdoster/neovim-configuration/commit/a05e6e437b160a08b2fbdb5836b60068880343b8))
* stylua fmt ([545c16a](https://github.com/vladdoster/neovim-configuration/commit/545c16a71f1574dfa4636b5b5aae6d5df8f7fca9))
* stylua fmt && add toggle-term plugin ([a1b21d7](https://github.com/vladdoster/neovim-configuration/commit/a1b21d74583995e3ec3ee7dd405214495a684c94))
* use folke/tokyonight.nvim colorscheme ([25e2741](https://github.com/vladdoster/neovim-configuration/commit/25e27413981c0c4a9852cfe81ba82638bd2fce64))

### style

* format with stylua ([0b42713](https://github.com/vladdoster/neovim-configuration/commit/0b42713b9649226fcaa229252e3c0ef7827a74a3))

# [1.17.0](https://github.com/vladdoster/neovim-configuration/compare/v1.16.0...v1.17.0) (2022-03-27)


### chore

* add java and yaml to treesitter ([1755ff9](https://github.com/vladdoster/neovim-configuration/commit/1755ff95fbebb231d730200d99a618ffb4c85a9b))
* remove lua_format in null_ls & add telescope keymaps ([e2bbd99](https://github.com/vladdoster/neovim-configuration/commit/e2bbd99fc1482daafc789495ff87399fa1834dec))

### feat

* formatting & misc plugin updates ([e1d358c](https://github.com/vladdoster/neovim-configuration/commit/e1d358ca6a2a002a482197ea413bb266b5e61057))

### fix

* rm old nvim cmd & fix keymapping ([09c2b2a](https://github.com/vladdoster/neovim-configuration/commit/09c2b2ac52b610bcb1063604564547d8e588fbff))

### maint

* update neovim options and make module ([70540e4](https://github.com/vladdoster/neovim-configuration/commit/70540e456818314ed5bef7c84b5ac9f5a88943d8))

### style

* apply lua-formatter ([1ad635a](https://github.com/vladdoster/neovim-configuration/commit/1ad635adc858c775ef2a01a6f38ef1ff62c876c1))
* apply lua-formatter ([7929959](https://github.com/vladdoster/neovim-configuration/commit/792995916915d35de53aa37305246a733f07b869))

# [1.16.0](https://github.com/vladdoster/neovim-configuration/compare/v1.15.0...v1.16.0) (2022-03-14)


### chore

* null-ls only loads lua-format config found in root git repo or dir ([7c34985](https://github.com/vladdoster/neovim-configuration/commit/7c34985158c8d02b18b4608870a8172dfb1601ac))

### new

* re-work of plugin configurations ([55241cf](https://github.com/vladdoster/neovim-configuration/commit/55241cfba536e9b6bad8616824120ae616c344c9))

# [1.15.0](https://github.com/vladdoster/neovim-configuration/compare/v1.14.0...v1.15.0) (2022-03-11)


### fix

* logic & terminolgy for if and when to bootstrap & sync packer ([48e908b](https://github.com/vladdoster/neovim-configuration/commit/48e908bdca3d24f4f5aab2aae043df591efed0e8))
* various cmp issues ([5def3b8](https://github.com/vladdoster/neovim-configuration/commit/5def3b82aa41f6d5de4a44eccd789ad7cf5403fe))
* various plugin errors during packer cold boot ([120d3e6](https://github.com/vladdoster/neovim-configuration/commit/120d3e675a5609178393f2061a39948c095e8e85))

### new

* lua-fmt Dockerdile and minor cmp updates ([8b31667](https://github.com/vladdoster/neovim-configuration/commit/8b31667c9cc4431d3c3b86d458047b7e25e4723d))

### style

* add icons via lspkind to cmp autocompletion ([bdf3c84](https://github.com/vladdoster/neovim-configuration/commit/bdf3c841f22106bb0f4a811d9407321a6c655564))
* fix Makefile indentation ([713eafa](https://github.com/vladdoster/neovim-configuration/commit/713eafa01e6118a3c267538414fff99a3d36b1f6))

# [1.14.0](https://github.com/vladdoster/neovim-configuration/compare/v1.13.1...v1.14.0) (2022-03-11)


### fix

* packer bootstrap process causing multi-second load times ([5ec3956](https://github.com/vladdoster/neovim-configuration/commit/5ec395612518f8494b6b52fa58ac5bc6bd957c21))

### update

* plugin & luafmt configuration updates ([f69327d](https://github.com/vladdoster/neovim-configuration/commit/f69327d1f93e4efeb5d939e860495045afdee9cc))

## [1.13.1](https://github.com/vladdoster/neovim-configuration/compare/v1.13.0...v1.13.1) (2022-03-10)


### fix

* add missing part of plugin path ([c6b66d3](https://github.com/vladdoster/neovim-configuration/commit/c6b66d305fdf2d3c6ed3109b07749cfe56c8523b))

# [1.13.0](https://github.com/vladdoster/neovim-configuration/compare/v1.12.1...v1.13.0) (2022-03-10)


### chore

* test misc. changes ([22d796d](https://github.com/vladdoster/neovim-configuration/commit/22d796d03cd75dc7edb6f5d5580d2d31792b0ebd))

### new

* re-work of config modules ([aa659fa](https://github.com/vladdoster/neovim-configuration/commit/aa659fab1f9467cc4ed5ed8f9f9d0f15399b40df))

## [1.12.1](https://github.com/vladdoster/neovim-configuration/compare/v1.12.0...v1.12.1) (2022-03-07)


### build

* update git credentials for releases ([19ccf03](https://github.com/vladdoster/neovim-configuration/commit/19ccf03ccbc91ea9c9c684e942ad5866c81e223d))

### chore

* remove unused autocmd ([f23acb8](https://github.com/vladdoster/neovim-configuration/commit/f23acb880160d985c22c26ba65dd864c8f190985))

### style

* modify lua-format config and apply to files ([9aa6937](https://github.com/vladdoster/neovim-configuration/commit/9aa693767df76fbe8bc5dfea4e2b9696541c2c6b))

# [1.12.0](https://github.com/vladdoster/neovim-configuration/compare/v1.11.0...v1.12.0) (2022-03-06)


### feat

* switch file browser to neo-tree ([ef9ac0e](https://github.com/vladdoster/neovim-configuration/commit/ef9ac0ee38c582e5ce45187f8cab3dcb26a6ddee))

### refactor

* packer bootstrap and plugin configurations ([05dbd4a](https://github.com/vladdoster/neovim-configuration/commit/05dbd4a6314c1e479b09985b2c7b0517db5a443b))

### style

* run lua-format ([03b4545](https://github.com/vladdoster/neovim-configuration/commit/03b4545005a3cf1bcdcde83f951c8b78999ced7b))
* run lua-format ([7083522](https://github.com/vladdoster/neovim-configuration/commit/7083522e952072fac0d4789e53c596fadebcd639))

### update

* add minor release tag `feat` ([03d4778](https://github.com/vladdoster/neovim-configuration/commit/03d4778db546dcea2b2338d35885a86804176473))

# [1.11.0](https://github.com/vladdoster/neovim-configuration/compare/v1.10.1...v1.11.0) (2022-03-03)


### new

* add lspkind and setup cmp_cli source ([40b08e7](https://github.com/vladdoster/neovim-configuration/commit/40b08e7a04470c24f2f26f2137aeb96e445efde6))

## [1.10.1](https://github.com/vladdoster/neovim-configuration/compare/v1.10.0...v1.10.1) (2022-03-03)


### chore

* better separation of concerns ([98b5562](https://github.com/vladdoster/neovim-configuration/commit/98b55627a6fb76345480608a8d3e970ae3bfef3b))
* better separation of concerns ([acc3c63](https://github.com/vladdoster/neovim-configuration/commit/acc3c63d8acffa5a5fc917ad4491aaf13a936e5c))
* remap md fmt to 'fm' & and rm blank lines to 'nl' ([1a1e272](https://github.com/vladdoster/neovim-configuration/commit/1a1e27201e8667f125222100aab5d93d800e1881))
* various plugin config updates ([c844741](https://github.com/vladdoster/neovim-configuration/commit/c8447415c31fd9dbd97eeee0d39a0f8bf347928e))

### doc

* fmt README.md ([362f4ad](https://github.com/vladdoster/neovim-configuration/commit/362f4ad4bf7cd7b122272692938396da82eaf374))

### refactor

* null-ls, cmp, toggle-term, notify, and comment ([951e0f1](https://github.com/vladdoster/neovim-configuration/commit/951e0f1780a86eea55773f7bb286c8553c9793ee))
* update aucmd, utils, aupairs, and mappings ([d6dd469](https://github.com/vladdoster/neovim-configuration/commit/d6dd469b06bf96d1d53a720e5f65e27550f03820))

### style

* fmt plugins/init.lua ([fa9c8a8](https://github.com/vladdoster/neovim-configuration/commit/fa9c8a8a791d01800d5a1b5fb144daf6dc700569))

# [1.10.0](https://github.com/vladdoster/neovim-configuration/compare/v1.9.2...v1.10.0) (2022-03-01)


### fix

* add missing conventional-changelog-eslint node dep ([68d5dc9](https://github.com/vladdoster/neovim-configuration/commit/68d5dc97a8549dd244fca33d88fc1ca2f0678041))
* check if colorscheme is available to remove err msg ([fbb9fd7](https://github.com/vladdoster/neovim-configuration/commit/fbb9fd71959bb7acff45c3c38036c6bf0338bce8))
* correct braces and condense redundant config ([80bcd29](https://github.com/vladdoster/neovim-configuration/commit/80bcd291ae7017b5edef49a930341656bfd59a15))

### new

* iron out broken config and remove 90% of bugs ([fd95fc2](https://github.com/vladdoster/neovim-configuration/commit/fd95fc284be240b46c028d502a7a8bf6bcaa6385))

### style

* clean up .releaserc and add missing v prefix in VERSION ([67d12dc](https://github.com/vladdoster/neovim-configuration/commit/67d12dc1488cb7f2ecbfdb7232cdd667135ce20f))

## [1.9.2](https://github.com/vladdoster/neovim-configuration/compare/v1.9.1...v1.9.2) (2022-02-28)


### Bug Fixes

* un-bork semantic-release configuration ([df91620](https://github.com/vladdoster/neovim-configuration/commit/df91620b4dc85130bf4e574260ba40a0e9ad6b7e))

## [1.9.1](https://github.com/vladdoster/neovim-configuration/compare/v1.9.0...v1.9.1) (2022-02-28)

# [1.9.0](https://github.com/vladdoster/neovim-configuration/compare/v1.8.0...v1.9.0) (2022-02-22)


### Features

* LSP config overhaul ([79603cb](https://github.com/vladdoster/neovim-configuration/commit/79603cb4f2341a544b7f68ba97087bb7d17b08e8))

# [1.8.0](https://github.com/vladdoster/neovim-configuration/compare/v1.7.1...v1.8.0) (2022-02-22)


### Bug Fixes

* autopairs annoying behavior removed ([38733a1](https://github.com/vladdoster/neovim-configuration/commit/38733a1ccc63be18aaccd45da75326cf69a1cde9))


### Features

* add nvim-tree file browser ([f68b11a](https://github.com/vladdoster/neovim-configuration/commit/f68b11ac0d6f6b893ceed013ab451dcdf587d73a))

## [1.7.1](https://github.com/vladdoster/neovim-configuration/compare/v1.7.0...v1.7.1) (2022-02-21)

# [1.7.0](https://github.com/vladdoster/neovim-configuration/compare/v1.6.2...v1.7.0) (2022-02-21)


### Features

* refactor directories to remove duplicate 1st char ([d5b7d47](https://github.com/vladdoster/neovim-configuration/commit/d5b7d47e50c2167dd7211c4cc8dc56f91c1cc22c))

## [1.6.2](https://github.com/vladdoster/neovim-configuration/compare/v1.6.1...v1.6.2) (2022-02-17)

## [1.6.1](https://github.com/vladdoster/neovim-configuration/compare/v1.6.0...v1.6.1) (2022-02-17)

# [1.6.0](https://github.com/vladdoster/neovim-configuration/compare/v1.5.0...v1.6.0) (2022-02-17)


### Bug Fixes

* cleanup dashboard config ([3fb41df](https://github.com/vladdoster/neovim-configuration/commit/3fb41df36660bfbc9c6402e1f57c723521a06236))
* rename conflicting path names ([88ebe1e](https://github.com/vladdoster/neovim-configuration/commit/88ebe1e959fca86661188945240638aacb3cf119))
* update lsp handlers and lspsage config ([8825307](https://github.com/vladdoster/neovim-configuration/commit/88253072cfd7bc234e0694980e8c8f8a82ecc51d))


### Features

* new format styling ([cb35c83](https://github.com/vladdoster/neovim-configuration/commit/cb35c838c596ccfa8961dd81c652ebac0a8da227))

# [1.5.0](https://github.com/vladdoster/neovim-configuration/compare/v1.4.1...v1.5.0) (2022-02-17)


### Bug Fixes

* required to define preset to 'conventionalcommits' ([7af8cb8](https://github.com/vladdoster/neovim-configuration/commit/7af8cb8d64b0119c652335d85e33856418cd3d91))


### Features

* add luarc.json config ([a85c4e4](https://github.com/vladdoster/neovim-configuration/commit/a85c4e4acd8a2325e87e449ced826e6b52f1c552))
* remove bufferline for minimal tabline ([fc9e6b8](https://github.com/vladdoster/neovim-configuration/commit/fc9e6b868e4ffc4b2a94d19632d120385b44c76f))

## [1.4.1](https://github.com/vladdoster/neovim-configuration/compare/v1.4.0...v1.4.1) (2022-02-15)


### Bug Fixes

* add `end` to autopairs config function ([ff44784](https://github.com/vladdoster/neovim-configuration/commit/ff447847f5aef875f2abcc562e6d5ea11bc21476))

# [1.4.0](https://github.com/vladdoster/neovim-configuration/compare/v1.3.3...v1.4.0) (2022-02-15)


### Features

* fmt & plugin updates ([6e0d6b4](https://github.com/vladdoster/neovim-configuration/commit/6e0d6b4c134b91e3dc26aa3279ec573dde767a1f))

## [1.3.3](https://github.com/vladdoster/neovim-configuration/compare/v1.3.2...v1.3.3) (2022-02-15)

## [1.3.2](https://github.com/vladdoster/neovim-configuration/compare/v1.3.1...v1.3.2) (2022-02-15)

## [1.3.1](https://github.com/vladdoster/neovim-configuration/compare/v1.3.0...v1.3.1) (2022-02-15)

# [1.3.0](https://github.com/vladdoster/neovim-configuration/compare/v1.2.1...v1.3.0) (2022-02-15)


### Bug Fixes

* autopairs, remove cruft, & fmt cmp config ([2da938d](https://github.com/vladdoster/neovim-configuration/commit/2da938d2667cb7575161f6893a48d332ae05305e))


### Features

* deep ocean variant of material color scheme ([3d4fbcc](https://github.com/vladdoster/neovim-configuration/commit/3d4fbccc52efad3f38dbef426002fa0b6314d7fa))

## [1.2.1](https://github.com/vladdoster/neovim-configuration/compare/v1.2.0...v1.2.1) (2022-02-14)


### Bug Fixes

* add fmt mapping & fmt {plugins,mappings}.lua ([ee7c586](https://github.com/vladdoster/neovim-configuration/commit/ee7c58650f6f0e976cb3b58da49c0579a541cc9e))

# [1.2.0](https://github.com/vladdoster/neovim-configuration/compare/v1.1.0...v1.2.0) (2022-02-13)


### Features

* add back formatting plugin & config ([a212f12](https://github.com/vladdoster/neovim-configuration/commit/a212f121097c325de94a895d5b9408236b3178db))
* update telescope, mappings, feline, & aucmds ([f7b7cb2](https://github.com/vladdoster/neovim-configuration/commit/f7b7cb2a3e55b3c298cc7007716d934dda964e6a))

# [1.1.0](https://github.com/vladdoster/neovim-configuration/compare/v1.0.2...v1.1.0) (2022-02-09)


### Features

* refactor most plugin configs and structure ([05ee2b1](https://github.com/vladdoster/neovim-configuration/commit/05ee2b1030c00ada8af2ef414d6394271314d097))

## [1.0.2](https://github.com/vladdoster/neovim-configuration/compare/v1.0.1...v1.0.2) (2022-02-07)

## [1.0.1](https://github.com/vladdoster/neovim-configuration/compare/v1.0.0...v1.0.1) (2022-02-06)

# 1.0.0 (2022-02-06)


### Features

* automate releases via semantic-release ([da0b29f](https://github.com/vladdoster/neovim-configuration/commit/da0b29fd8dfc91bac2d038cc4975ced99c2db2af))
* **bootstrap packer:** bootstrap packer & install plugins ([cc31876](https://github.com/vladdoster/neovim-configuration/commit/cc318768f72eb10cda9aabe9fc068dcb8ce61d56))
* **bootstrap:** quick bootstrapping ([4a1d94b](https://github.com/vladdoster/neovim-configuration/commit/4a1d94b1468c380d51c21cde24230a481cb3db8a))
* **ci/cd:** update lua formatting ([47bec93](https://github.com/vladdoster/neovim-configuration/commit/47bec93a4ee32fe3c438769c028daccbb293bc57))
* **lsp-signature:** detailed function signature documentation ([4218c28](https://github.com/vladdoster/neovim-configuration/commit/4218c28134a620d04eb4ce2ba85454c3d2abe0c0))
* **plugins:** add commentary, sandwhich, and cleanup configs ([9a9141a](https://github.com/vladdoster/neovim-configuration/commit/9a9141a5961ba0d81b0bf1ea130bd0e8ffdd16e6))
