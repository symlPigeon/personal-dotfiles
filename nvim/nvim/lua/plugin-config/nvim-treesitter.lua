local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("nvim-treesitter not found", vim.log.levels.WARN)
    return
end

treesitter.setup({
    -- language parser
    ensure_installed = {
        "c",
        "bash",
        "cmake",
        "comment",
        "cpp",
        "css",
        "dart",
        "dockerfile",
        "fish",
        "gitattributes",
        "gitignore",
        "go",
        "help",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "kotlin",
        "latex",
        "lua",
        "make",
        "markdown",
        "php",
        "python",
        "regex",
        "sql",
        "typescript",
        "verilog",
        "vim",
        "yaml"
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false
    },
    -- incremental selection
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<BS>",
            node_decremental = "<TAB>"
        }
    },
    -- indent
    indent = {
        enable = true
    }
})

-- code fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- set default to unfolded
vim.opt.foldlevel = 99
