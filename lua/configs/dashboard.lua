local M = {}

function M.config()
    local g = vim.g
    local fn = vim.fn

    local plugins_count = fn.len(fn.globpath(
                                     '~/.local/share/nvim/site/pack/packer/start',
                                     '*', 0, 1))

    g.dashboard_disable_statusline = 1
    g.dashboard_default_executive = 'telescope'
    g.dashboard_custom_header = {
        ' ',
        ' ',
        ' ',
        ' ',
        ' ',
        '                                             o88                 ',
        'oo oooooo   ooooooooo8  ooooooo  oooo   oooo oooo  oo ooo oooo   ',
        ' 888   888 888oooooo8 888     888 888   888   888   888 888 888  ',
        ' 888   888 888        888     888  888 888    888   888 888 888  ',
        'o888o o888o  88oooo888  88ooo88      888     o888o o888o888o888o ',
        ' ',
        ' ',
        ' ',
        ' '
    }

    g.dashboard_custom_section = {
        a={
            description={'   Find File                 SPC f f'},
            command='Telescope find_files'
        },
        b={
            description={'   Recents                   SPC f o'},
            command='Telescope oldfiles'
        },
        c={
            description={'   Find Word                 SPC f w'},
            command='Telescope live_grep'
        },
        d={
            description={'   New File                  SPC f n'},
            command='DashboardNewFile'
        },
        e={
            description={'   Bookmarks                 SPC b m'},
            command='Telescope marks'
        },
        f={
            description={'   Last Session              SPC s l'},
            command='SessionLoad'
        }
    }

    g.dashboard_custom_footer = {
        ' ',
        ' AstroVim loaded ' .. plugins_count .. ' plugins '
    }
end

return M
