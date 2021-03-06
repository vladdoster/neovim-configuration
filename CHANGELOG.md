# [2.3.0](https://github.com/vladdoster/neovim-configuration/compare/v2.2.0...v2.3.0) (2022-07-23)


### feat

* add aerial code outline plugin ([3a654f6](https://github.com/vladdoster/neovim-configuration/commit/3a654f641ad9517b5ee18e255e5adb2a214f28a3))

### fix

* Lsp config, null-ls, telescope, and comment ([d0e56b3](https://github.com/vladdoster/neovim-configuration/commit/d0e56b30d843d5ce79cfa4cbb384bb584f911609))

# [2.2.0](https://github.com/vladdoster/neovim-configuration/compare/v2.1.0...v2.2.0) (2022-07-22)


### feat

* enabled SHADA (shared data) option ([7cb91bb](https://github.com/vladdoster/neovim-configuration/commit/7cb91bb0aa082797eb4d1c9e5adb84b70e2c75eb))

### fix

* lua-format install Makefile target ([91ffa78](https://github.com/vladdoster/neovim-configuration/commit/91ffa785161f2b1ca4e46e8f31ea6e9be3e1f42d))
* set commentstrings for certain filetypes ([0b8576a](https://github.com/vladdoster/neovim-configuration/commit/0b8576a0503d1ccbbc13a254c535e3798eea4e20))
* use v0.8.0 api for null-ls formatting ([60d8da6](https://github.com/vladdoster/neovim-configuration/commit/60d8da66fd054c07b5d4e199f3983f4b38267f0a))

### maint

* add servers for lsp-installer ([c5d42c5](https://github.com/vladdoster/neovim-configuration/commit/c5d42c53aee2f4a7d437527a1454da2b0036f945))
* update comment and neo-tree packer config ([0f35751](https://github.com/vladdoster/neovim-configuration/commit/0f35751056e1a08084a3a20afc6f16085e7bf42e))

# [2.1.0](https://github.com/vladdoster/neovim-configuration/compare/v2.0.1...v2.1.0) (2022-07-17)


### feat

* add bashls, dockerls, pyright, pylsp LSP servers ([871a1f0](https://github.com/vladdoster/neovim-configuration/commit/871a1f02f551261d5a03575a9762711d0f75c44a))
* add editorconfig/editorconfig-vim plugin ([c711c73](https://github.com/vladdoster/neovim-configuration/commit/c711c73c49c7c2983b47b94fbc65f474a4635ab4))

### fix

* remove null-ls fmt source zsh & add beautysh ([4b029dd](https://github.com/vladdoster/neovim-configuration/commit/4b029dda3abf1b1727286d2bdbd1afe91b7e8743))

### maint

* add indent and func style to beautysh in null-ls ([71e83d8](https://github.com/vladdoster/neovim-configuration/commit/71e83d82ab631004d2602bdc49729f7404c2e369))
* null-ls config uses new nvim v0.8.0 api ([fc42f4e](https://github.com/vladdoster/neovim-configuration/commit/fc42f4eaea5a3b425bbb87981882ca849cd1477a))

## [2.0.1](https://github.com/vladdoster/neovim-configuration/compare/v2.0.0...v2.0.1) (2022-07-01)


### fix

* null-ls formatter selection ([aa5dd2c](https://github.com/vladdoster/neovim-configuration/commit/aa5dd2c256242d4b130973f446c1a11379aecdc1))

### maint

* add checkmake to null-ls diagnostic linters ([2173fc6](https://github.com/vladdoster/neovim-configuration/commit/2173fc6d02f93154e26354c93c94da9c341e3be6))
* open neo-tree when opening a dir ([e9382e8](https://github.com/vladdoster/neovim-configuration/commit/e9382e85d6f64bf76ffbe722f9a91109f602f9a8))
* remove cruft lsp setup & condense var init logic ([21b782d](https://github.com/vladdoster/neovim-configuration/commit/21b782d36f238a0452ff3352d5d2c6dc2965d95e))

### style

* update lua-format config and re-format code ([b7f36e9](https://github.com/vladdoster/neovim-configuration/commit/b7f36e976db30b12b680e6f5779c39ac02043894))

# [2.0.0](https://github.com/vladdoster/neovim-configuration/compare/v1.30.1...v2.0.0) (2022-06-12)


### fix

* remove icons for nvim-cmp ([ada3707](https://github.com/vladdoster/neovim-configuration/commit/ada370706cd90ad3623cdbe885a36c87cd61e705))

### maint

* add refactor commit tag and format ([a9ab3bc](https://github.com/vladdoster/neovim-configuration/commit/a9ab3bcf4144152ea75188d3866145917c7a5899))

### refactor

* lsp configuration simplified ([fa65959](https://github.com/vladdoster/neovim-configuration/commit/fa6595980f697ce097586d8a0d9b2c826164eb7a))

## [1.30.1](https://github.com/vladdoster/neovim-configuration/compare/v1.30.0...v1.30.1) (2022-06-10)


### fix

* lua lsp init, lsp keybinds, and telescope config ([276f29d](https://github.com/vladdoster/neovim-configuration/commit/276f29d6dd164cac6dfadb3ab99b6a2ac72bb5e0))

### maint

* print which lua files are found for formatting ([dd8505f](https://github.com/vladdoster/neovim-configuration/commit/dd8505f35a714cfda14f6d9fefbf7ba94ff3ffba))
* update lsp related configurations ([5dbdc19](https://github.com/vladdoster/neovim-configuration/commit/5dbdc1984d8236a25b9e6c863334870b9b5ba37f))
* update target, formatting, null-ls lua formatting, and dial keymaps ([f695738](https://github.com/vladdoster/neovim-configuration/commit/f695738d3bae724f6aa2ffd9093348c003c67a24))

# [1.30.0](https://github.com/vladdoster/neovim-configuration/compare/v1.29.0...v1.30.0) (2022-06-04)


### docs

* updates for plugins.lua ([4c48722](https://github.com/vladdoster/neovim-configuration/commit/4c487226efaa0b6cb4bdb53fd278557df5852cd4))

### feat

* add dial incrementing plugin ([a43a54c](https://github.com/vladdoster/neovim-configuration/commit/a43a54c8a18f1e9bf5a0d1edfee106def8289609))
* add dial.nvim to add {in,de}rement features ([1a14cd1](https://github.com/vladdoster/neovim-configuration/commit/1a14cd1d32cc7dcc2c06dc045321feb4d4c9e324))

### fix

* format Make target updated && telescope config ([f454a7f](https://github.com/vladdoster/neovim-configuration/commit/f454a7f2b2fe21668c8586093c6d05052af7bd2e))

# [1.29.0](https://github.com/vladdoster/neovim-configuration/compare/v1.28.0...v1.29.0) (2022-05-31)


### feat

* add telescope-project plugin ([f1e532f](https://github.com/vladdoster/neovim-configuration/commit/f1e532fa74c38fa4eef909485c3f81ee838f058b))

### fix

* nvim-cmp load order ([22e96a2](https://github.com/vladdoster/neovim-configuration/commit/22e96a2d422a4527a76ffac2f942be8c9f678531))
* rm redundant keybinds ([d07777c](https://github.com/vladdoster/neovim-configuration/commit/d07777c7cfc4354ed6d4522348c6022294fe1bd7))

### style

* format null-ls, telescope, and lsp-installer configs ([30a7682](https://github.com/vladdoster/neovim-configuration/commit/30a7682ef7d7d17ebdc710cb1d72dd1f5521649b))

# [1.28.0](https://github.com/vladdoster/neovim-configuration/compare/v1.27.0...v1.28.0) (2022-05-29)


### feat

* add terraform-docs_telescope plugin ([5d90091](https://github.com/vladdoster/neovim-configuration/commit/5d9009120915214c5d9d62a49956ebfb80f365a7))
* neotree tab and focus functionality ([0d28981](https://github.com/vladdoster/neovim-configuration/commit/0d28981b8650ac0ecd94f5a5404b7dcd5ff5aa4e))
* switch to neo-tree, remove nvim-tree, and update key mappings ([2f5bd32](https://github.com/vladdoster/neovim-configuration/commit/2f5bd32b92bbe621d43fe2ea859a15e3416a4706))

### fix

* add cmp_nvim_lsp module name ([f0c6352](https://github.com/vladdoster/neovim-configuration/commit/f0c6352118dfaa433da5b0010853e8f8049835fd))
* change to material theme which is activley maintained ([5860172](https://github.com/vladdoster/neovim-configuration/commit/5860172bcdd4d9bb6e87a777022e26094d5d28ab))
* check if lua-format before attempting to install ([8ccb4d7](https://github.com/vladdoster/neovim-configuration/commit/8ccb4d74e63288a9a349db1f00f19fb4066198c0))
* cmp_nvim_lsp config loading with lsp-installer ([04b5c9d](https://github.com/vladdoster/neovim-configuration/commit/04b5c9d5224600b30ba989b50e064fd0e38345bb))
* compilation errors ([0383615](https://github.com/vladdoster/neovim-configuration/commit/038361543fa8dd9254c4b27f730f0f863a08885d))
* loading of treesitter config in packer ([2f4f810](https://github.com/vladdoster/neovim-configuration/commit/2f4f810688c87fbf995e6a44283ec75b205f5b02))
* lsp formatting errors ([8a3aa05](https://github.com/vladdoster/neovim-configuration/commit/8a3aa05e4c1ea2f488cb75d7c7ca7a7d1f53f018))
* mdformat changed to format ([72028f1](https://github.com/vladdoster/neovim-configuration/commit/72028f11080e6441f100f4a180acb3efee8457d5))
* null-ls and lsp-installer config ([315df30](https://github.com/vladdoster/neovim-configuration/commit/315df3014a351a98978de36bf1de06f0f0cefb54))
* nvim-cmp completion ([f49845c](https://github.com/vladdoster/neovim-configuration/commit/f49845c588d60a6566a26a15d14894b3a05a3aa1))
* nvim-cmp mappings use tab now ([f0921c5](https://github.com/vladdoster/neovim-configuration/commit/f0921c5bb8d0cf39d8ed19e32082c87116a2afee))
* nvim-installer & lspconfig loading & null-ls ([5d426d4](https://github.com/vladdoster/neovim-configuration/commit/5d426d40482195f446277695413136bfd6379378))
* remove majority of treeitter config until bug breaking syntax highlighting is found ([66f1156](https://github.com/vladdoster/neovim-configuration/commit/66f1156250407b63bd8d36a2a3d9e7f4aaa5425b))

### maint

* add neo-tree to lualine extensions ([0020ff3](https://github.com/vladdoster/neovim-configuration/commit/0020ff3d04963bd179eb2ca46810426047b23348))
* add partial tab to view keymap to mimic nvim-tree ([7d1f16b](https://github.com/vladdoster/neovim-configuration/commit/7d1f16b26eb1cffc80391bbcd5e3f8688f2b9160))
* add tab completion to nvim-cmp ([1afe3b4](https://github.com/vladdoster/neovim-configuration/commit/1afe3b4d8f15f83754b2ee17aa8c8e56227ca108))
* fix bazel issue ([d15ae2a](https://github.com/vladdoster/neovim-configuration/commit/d15ae2a4a0f23de2398d1efbdd80fa9ae22d8d9e))
* increase nvim formatter timeout ([c1bd386](https://github.com/vladdoster/neovim-configuration/commit/c1bd3867a5ab32beaeb668d04cf15aada01be6f9))
* remove escape \ and comment parser from treesitter config ([a6d38ed](https://github.com/vladdoster/neovim-configuration/commit/a6d38ed0e22c916bd6b0a88b029f549b698b1950))
* remove removed plugin keymaps ([ed9654c](https://github.com/vladdoster/neovim-configuration/commit/ed9654ca9da10a9c89d86ed4b66eff96c87ed5da))
* remove selene configuration ([5b11fef](https://github.com/vladdoster/neovim-configuration/commit/5b11fefa3f781800697ec281c2c3808093e2c08f))
* remove unused plugin configuration files ([35195b1](https://github.com/vladdoster/neovim-configuration/commit/35195b12612b03fd0b4e37a3c468dac07dc5c566))
* remove unused plugins and change to condensed config syntax for plugin config ([816676b](https://github.com/vladdoster/neovim-configuration/commit/816676b7dfbe2275597a3c7a5cdc2e376a3732be))
* remove unused symbols-outline.nvim config ([0457a34](https://github.com/vladdoster/neovim-configuration/commit/0457a344f0a48f2ceba5d4de17bf240b303a9e12))
* remove unused treesitter config code ([bd2f708](https://github.com/vladdoster/neovim-configuration/commit/bd2f70882adc1b91e4a906f201d22cb971fe1465))
* update notify.nvim size and show duration ([2b219b0](https://github.com/vladdoster/neovim-configuration/commit/2b219b017d23c0802634d5055b0e69aab517acc9))
* update nvim-cmp configuration ([d2b5062](https://github.com/vladdoster/neovim-configuration/commit/d2b50624664657c8ac2d175b9358b70960c74227))
* use mdformat in null-ls ([de7c2ea](https://github.com/vladdoster/neovim-configuration/commit/de7c2eac76920bbd3c71cf35bf63d36c633be7ba))

### refactor

* "<tab>, h & l nav, and keep focused in neo-tree config ([bfef060](https://github.com/vladdoster/neovim-configuration/commit/bfef06080004ab9e3efc58171fe59ae29fe604bb))

### style

* add checkmake and fix trim whitespace null-ls sources ([ab119f2](https://github.com/vladdoster/neovim-configuration/commit/ab119f2d77edcd67cfffcee626f267b317450a44))
* remove blank lines and markdown plugins ([ab2d6d0](https://github.com/vladdoster/neovim-configuration/commit/ab2d6d0d54ebc9934d1b9946b5161d4b4d677310))

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
