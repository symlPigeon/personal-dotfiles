local M = {
  "yorickpeterse/nvim-window",

  keys = { "<leader>wj", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Jump to Window" },

  config = true
}

function M.config()
  local wk = require("which-key")
  wk.add({
    { "<leader>wj", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Jump to Window" }
  })
end

return M
