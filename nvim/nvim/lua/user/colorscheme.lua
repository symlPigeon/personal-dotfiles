local M = {
	"folke/tokyonight.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
	require("tokyonight").setup({
		on_highlights = function(hl, c)
			local prompt = "#2d3149"
			hl.TelescopeNormal = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopeBorder = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopePromptNormal = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopePromptBorder = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopePromptTitle = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopePreviewTitle = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopeResultsTitle = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
		end,
	})

    -- vim.api.nvim_set_hl(0, "@lsp.mod.unsafe.rust", { fg = "#ff4545"})
    -- vim.api.nvim_set_hl(0, "@lsp.typemod.method.unsafe.rust", { fg = "#ff4545"})
    -- vim.api.nvim_set_hl(0, "@lsp.typemod.macro.unsafe.rust", { fg = "#ff4545"})
	vim.cmd.colorscheme("tokyonight-moon")
end

return M
