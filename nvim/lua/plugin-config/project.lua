local status, project = pcall(require, "project_nvim")
if not status then
    vim.notify("project_nvim not found", vim.log.levels.WARN)
    return
end

vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
    detection_methods = {
        "pattern"
    },
    patterns = {
        ".git",
        "__darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json",
        ".project",
        ".sln"
    }
})

local status, telescope = pcall(require, "telescope")
if not status then
    vim.notify("telescope not found", vim.log.levels.ERROR)
    return
end
pcall(telescope.load_extension, "projects")
