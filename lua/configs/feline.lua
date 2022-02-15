if not pcall(require, 'feline') then return end

local colors = {
    bg='#282c34',
    fg='#abb2bf',
    yellow='#e0af68',
    cyan='#56b6c2',
    darkblue='#081633',
    green='#98c379',
    orange='#d19a66',
    violet='#a9a1e1',
    magenta='#c678dd',
    blue='#61afef',
    red='#e86671'
}

local vi_mode_colors = {
    NORMAL=colors.green,
    INSERT=colors.red,
    VISUAL=colors.magenta,
    OP=colors.green,
    BLOCK=colors.blue,
    REPLACE=colors.violet,
    ['V-REPLACE']=colors.violet,
    ENTER=colors.cyan,
    MORE=colors.cyan,
    SELECT=colors.orange,
    COMMAND=colors.green,
    SHELL=colors.green,
    TERM=colors.green,
    NONE=colors.yellow
}

local function file_osinfo() return vim.bo.fileformat:upper() end

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

local comps = {
    vi_mode={
        left={
            provider=function()
                return ' ' .. vi_mode_utils.get_vim_mode()
            end,
            hl=function()
                local val = {
                    name=vi_mode_utils.get_mode_highlight_name(),
                    fg=vi_mode_utils.get_mode_color()
                }
                return val
            end,
            right_sep=' '
        },
        right={
            provider='▊',
            hl=function()
                local val = {
                    name=vi_mode_utils.get_mode_highlight_name(),
                    fg=vi_mode_utils.get_mode_color()
                }
                return val
            end,
            left_sep=' ',
            right_sep=' '
        }
    },
    file={
        info={
            provider={
                name='file_info',
                opts={
                    type='relative-short',
                    file_readonly_icon='  ',
                    file_modified_icon='ﱐ'
                }
            },
            hl={fg=colors.blue, style='bold'}
        },
        encoding={
            provider='file_encoding',
            left_sep=' ',
            hl={fg=colors.violet, style='bold'}
        },
        type={provider='file_type'},
        os={
            provider=file_osinfo,
            left_sep=' ',
            hl={fg=colors.violet, style='bold'}
        },
        position={provider='position', left_sep=' ', hl={fg=colors.cyan}}
    },
    left_end={
        provider=function() return '' end,
        hl={fg=colors.bg, bg=colors.blue}
    },
    line_percentage={
        provider='line_percentage',
        left_sep=' ',
        hl={style='bold'}
    },
    scroll_bar={
        provider='scroll_bar',
        left_sep=' ',
        hl={fg=colors.blue, style='bold'}
    },
    diagnos={
        err={
            provider='diagnostic_errors',
            right_sep=' ',
            enabled=true,
            hl={fg=colors.red}
        },
        warn={
            provider='diagnostic_warnings',
            right_sep=' ',
            enabled=true,
            hl={fg=colors.yellow}
        },
        info={
            provider='diagnostic_info',
            right_sep=' ',
            enabled=true,
            hl={fg=colors.blue}
        },
        hint={
            provider='diagnostic_hints',
            right_sep=' ',
            enabled=true,
            hl={fg=colors.cyan}
        }
    },
    lsp={
        name={
            provider='lsp_client_names',
            -- left_sep = ' ',
            right_sep=' ',
            icon='LSP: ',
            hl={fg=colors.yellow}
        }
    },
    git={
        branch={
            provider='git_branch',
            left_sep=' ',
            hl={fg=colors.violet, style='bold'}
        },
        add={provider='git_diff_added', hl={fg=colors.green}},
        change={provider='git_diff_changed', hl={fg=colors.orange}},
        remove={provider='git_diff_removed', hl={fg=colors.red}}
    }
}

local components = {active={}, inactive={}}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[3], comps.diagnos.err)
table.insert(components.active[3], comps.diagnos.warn)
table.insert(components.active[3], comps.diagnos.hint)
table.insert(components.active[3], comps.diagnos.info)
table.insert(components.active[3], comps.lsp.name)
table.insert(components.active[3], comps.file.os)
table.insert(components.active[3], comps.file.position)
table.insert(components.active[3], comps.line_percentage)
table.insert(components.active[3], comps.scroll_bar)
table.insert(components.active[3], comps.vi_mode.right)

-- require'feline'.setup {}
require'feline'.setup {
    colors={bg=colors.bg, fg=colors.fg},
    components=components,
    vi_mode_colors=vi_mode_colors,
    force_inactive={
        filetypes={'packer', 'NvimTree', 'fugitive', 'fugitiveblame'},
        buftypes={'terminal'},
        bufnames={}
    }
}
