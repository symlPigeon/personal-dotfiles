local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}

function M.config()
	local events = require("neo-tree.events")
	require("neo-tree").setup({
		close_if_last_window = true,
		window = {
			width = 30,
		},
		default_component_configs = {
			buffers = {
				follow_current_file = true,
			},
			filesystem = {
				follow_current_file = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						"node_modules",
					},
					never_show = {
						".DS_Store",
						"thumbs.db",
					},
				},
			},
			git_status = {
				symbols = {
					-- Change type
					added = "✚", -- NOTE: you can set any of these to an empty string to not show them
					deleted = "✖",
					modified = "",
					renamed = "󰁕",
					-- Status type
					untracked = "U",
					ignored = "",
					unstaged = "M",
					staged = "",
					conflict = "",
				},
				align = "right",
			},
		},
		source_selector = {
			winbar = true,
			statusline = false,
		},
		event_handlers = {
			event = events.NEO_TREE_BUFFER_ENTER,
			handler = function()
				vim.cmd("stopinsert")
			end,
		},
	})
end

return M
