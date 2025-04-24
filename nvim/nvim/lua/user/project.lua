local M = {
  "coffebar/neovim-project",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim"},
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100
}

function M.config()
    vim.opt.sessionoptions:append("globals")
    require("neovim-project").setup({
      projects = {
        "~/Sources/*",
        "~/.config/*",
      },
      picker = {
        type = "telescope"
      }
    })
end

return M
