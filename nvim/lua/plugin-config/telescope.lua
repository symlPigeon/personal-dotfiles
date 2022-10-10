local status, telescope = pcall(require, "telescope")
if not status then
    vim.notify("telescope not found", vim.log.levels.WARN)
    return
end

telescope.setup({
    defaults = {
        initial_mode = "insert",
        mappings = require("keybindings").telescopeList
    },
    pickers = {
        find_files = {}
    },
    extensions = {}
})
