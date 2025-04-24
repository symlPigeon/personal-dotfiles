local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
    "nvim-tree/nvim-web-devicons"
  },
}

function M.config()
  require("lualine").setup {
    options = {
      theme = "tokyonight-moon",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = " ", right = "" },
      ignore_focus = { "NeoTree" },
    },
    sections = {
      lualine_a = { "filename" },
      lualine_b = { "branch" },
      lualine_c = { "diagnostics" },
      lualine_x = { "copilot", "filetype", "encoding", {"fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" }} },
      lualine_y = { "progress" },
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive", "toggleterm", "neo-tree", "lazy", "trouble" },
  }
end

return M
