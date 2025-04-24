local M = {
  "HiPhish/rainbow-delimiters.nvim",
  event =  "BufRead",
  submodules = false,
}

function M.config()
  require("rainbow-delimiters.setup").setup({
        highlight = {
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        }
      })
end

return M
