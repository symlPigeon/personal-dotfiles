local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("nvim-tree not found", vim.log.levels.WARN)
    return
end

-- hotkey
if vim.g.vscode then
    local list_keys = require('keybindings-vsc').nvimTreeList
else
    local list_keys = require('keybindings').nvimTreeList
end

-- configure
nvim_tree.setup({
    git = {
        enable = true
    },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true
    },
    filters = {
        dotfiles = true,
        custom = {
            'node_modules'
        }
    },
    view = {
        width = 30,
        side = 'left',
        hide_root_folder = false,
        mappings = {
            custom_only = false,
            list = list_keys
        },
        number = false,
        relativenumber = false,
        signcolumn = 'yes'
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = true
        }
    }
})

-- auto close
vim.cmd([[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
