local M = {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "ojroques/nvim-bufdel",
  }
}

function M.config()
    require("bufdel").setup({
      quit = false
  })
    local bufferline = require("bufferline")
    bufferline.setup({
    options = {
      mode = "buffers",
      themable = true,
      numbers = "none",
      close_command = "BufDel %d",
      left_mouse_command = "buffer %d",

      indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon',
      },
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
        return buf.name
      end,
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is deduplicated
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center"
        }
      },
      color_icons = true,
      always_show_bufferline = true,
      hover = {
        enable = true,
        delay = 200,
        reveal = { "close" }
      },
      pick = {
        alphabet = "abcdefghijklmnopqrstuvwxyz",
      }
    }
  })
  vim.keymap.set("n", "<c-h>", "<cmd>BufferLineCyclePrev<cr>", { silent = true })
  vim.keymap.set("n", "<c-l>", "<cmd>BufferLineCycleNext<cr>", { silent = true })
end

return M
