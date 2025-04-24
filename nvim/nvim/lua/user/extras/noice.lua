local M = {
"folke/noice.nvim",
event = "VeryLazy",
opts = {},
dependencies = {
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
  }
} 

function M.config()
  require("noice").setup({
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true
      }
    },
    present = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true
    }
  })
end

return M
