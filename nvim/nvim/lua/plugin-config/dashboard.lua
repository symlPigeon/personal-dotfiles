local status, dashboard = pcall(require, "dashboard")
if not status then
    vim.notify("dashboard not found", vim.log.levels.WARN)
    return
end

dashboard.custom_footer = {
    "",
    "",
    "https://github.com/symlpigeon"
}

dashboard.custom_center = {
    {
        icon = "  ",
        desc = "Projects                            ",
        action = "Telescope projects"
    },
    {
        icon = "  ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles"
    },
    {
        icon = "  ",
        desc = "Edit keybindings                    ",
        action = "edit ~/.config/nvim/lua/keybindings.lua"
    },
    {
        icon = "  ",
        desc = "Edit Projects                       ",
        action = "edit ~/.local/share/nvim/project_nvim/project_history"
    }
}

dashboard.custom_header = {
    [[ EASIER, STRONGER                             ]],
    [[ AND MORE LIGHTWEIGHT ___      _______ __  __ ]],
    [[                     | \ \    / |_   _|  \/  |]],
    [[  ___ _   _ _ __ ___ | |\ \  / /  | | | \  / |]],
    [[ / __| | | | '_ ` _ \| | \ \/ /   | | | |\/| |]],
    [[ \__ | |_| | | | | | | |  \  /   _| |_| |  | |]],
    [[ |___/\__, |_| |_| |_|_|   \/   |_____|_|  |_|]],
    [[       __/ |                                  ]],
    [[      |___/             A NEOVIM CONFIGURATION]],
    [[                         CREATED BY SYMLPIGEON]]
}
