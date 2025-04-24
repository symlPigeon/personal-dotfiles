local M = {
  "gennaro-tedesco/nvim-possession",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
}

function M.config()
  require("nvim-possession").setup({
    autoload = true,
    autosave = true,
  })
end

return M
