local M = {
    'smoka7/hop.nvim',
    tags = '*',
}

function M.config()
  require('hop').setup({
    keys = 'etovxqpdygfblzhckisuran',
    quit_key = " ",
  })
  
  vim.keymap.set("n", "ss", ":HopWord<cr>", { silent = true })
  vim.keymap.set("n", "sp", ":HopPattern<cr>", { silent = true })
end

return M
