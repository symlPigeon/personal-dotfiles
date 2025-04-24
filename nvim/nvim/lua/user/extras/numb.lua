local M = {
  "nacro90/numb.nvim",
  event = "BufRead",
}

function M.config()
  require("numb").setup({
    show_numbers = true,
    show_cursorline = true
  })
end

return M
