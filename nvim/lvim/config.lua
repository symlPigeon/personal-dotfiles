-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  -- colorscheme
  { "shaunsingh/moonlight.nvim" },

  -- LSP Enhancement
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require('lspsaga').setup({})
    end
  },

  -- hop
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "ss", ":HopWord<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "sp", ":HopPattern<cr>", { silent = true })
    end,
  },

  -- minimap
  {
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },

  -- numb(Jump to line number)
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true,    -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },

  -- better quick fix
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  -- better file manager
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 30,
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db"
            },
          },
        },
        source_selector = {
          winbar = true,
          statusline = false
        },
      })
    end
  },
  -- window picker
  {
    "yorickpeterse/nvim-window",
    config = function()
      require("nvim-window").setup({})
    end
  },
  -- auto close tag / edit tag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- colorful brackets
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  -- show symbols
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  -- better diagnostics
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- realtime eval
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  -- copilot
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  -- smooth scolling
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  -- pick up where left off
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    'rcarriga/nvim-notify',
  },
  -- noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  { "CRAG666/code_runner.nvim", config = true },
}

lvim.builtin.nvimtree.active = false -- disable nvim-tree to use neo-tree

-- Key mappings

-- rebind lsp keys
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.lsp.buffer_mappings.normal_mode['KK'] = nil
lvim.lsp.buffer_mappings.normal_mode['gd'] = nil
lvim.lsp.buffer_mappings.normal_mode['gD'] = nil
lvim.lsp.buffer_mappings.normal_mode['gr'] = nil
lvim.lsp.buffer_mappings.normal_mode['gI'] = nil
lvim.lsp.buffer_mappings.normal_mode['gs'] = nil
lvim.lsp.buffer_mappings.normal_mode['gl'] = nil
lvim.lsp.buffer_mappings.normal_mode['glgl'] = nil

lvim.keys.normal_mode["gd"] = "<cmd>Lspsaga peek_definition<cr>"
lvim.keys.normal_mode["gh"] = "<cmd>Lspsaga hover_doc<cr>"
lvim.keys.normal_mode["gr"] = "<cmd>Lspsaga finder<cr>"
lvim.keys.normal_mode["gp"] = "<cmd>Lspsaga show_line_diagnostics<cr>"
lvim.keys.normal_mode["gI"] = "<cmd>lua vim.lsp.buf.implementation()<cr>"
lvim.keys.normal_mode["gD"] = "<cmd>Lspsaga goto_definition<cr>"
lvim.keys.normal_mode["go"] = "<cmd>Lspsaga outline<cr>"
lvim.keys.normal_mode["gR"] = "<cmd>Lspsaga lsp_rename<cr>"
lvim.keys.normal_mode["ga"] = "<cmd>Lspsaga code_action<cr>"
lvim.keys.normal_mode["gs"] = "<cmd>SymbolsOutline<cr>"
-- neo-tree
lvim.builtin.which_key.mappings["e"] = { "<cmd>NeoTreeFocusToggle<cr>", "File Explorer" }
-- pick window
lvim.keys.normal_mode["<c-w>"] = "<cmd>lua require('nvim-window').pick()<cr>"
-- format
lvim.builtin.which_key.mappings["="] = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format" }
-- keybindings for Trouble
lvim.builtin.which_key.mappings["D"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
-- keybindings for terminal
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}
-- bufferline keybindings
lvim.keys.normal_mode["<a-h>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<a-l>"] = "<cmd>BufferLineCycleNext<cr>"

-- indent-blankline
lvim.builtin.indentlines.options.show_current_context = true
lvim.builtin.indentlines.options.show_current_context_start = true
-- terminal use fish
lvim.builtin.terminal.shell = "fish"
-- always show bufferline
lvim.builtin.bufferline.options.always_show_bufferline = true

-- alpha
lvim.builtin.alpha.dashboard.section.header.val = {
  [[ EASIER, STRONGER                             ]],
  [[ AND MORE LIGHTWEIGHT ___      _______ __  __ ]],
  [[                     | \ \    / |_   _|  \/  |]],
  [[  ___ _   _ _ __ ___ | |\ \  / /  | | | \  / |]],
  [[ / __| | | | '_ ` _ \| | \ \/ /   | | | |\/| |]],
  [[ \__ | |_| | | | | | | |  \  /   _| |_| |  | |]],
  [[ |___/\__, |_| |_| |_|_|   \/   |_____|_|  |_|]],
  [[       __/ |                                  ]],
  [[      |___/             A NEOVIM CONFIGURATION]],
  [[                         CREATED BY SYMLPIGEON]]
}
lvim.builtin.alpha.dashboard.section.footer.val = {
  "  Based on LunarVim",
  "Modified by symlpigeon"
}

-- nvim-ts incremental selection
lvim.builtin.treesitter.incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "<cr>",
    node_incremental = "<cr>",
    scope_incremental = "<bs>",
    node_decremental = "<tab>"
  }
}

-- activate dap
lvim.builtin.dap.active = true

-- debug for python
dap = require("dap")
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

dap.adapters.python = {
  type = "executable",
  command = '/usr/bin/python',
  args = { '-m', 'debugpy.adapter' },
}
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = mason_path .. 'packages/codelldb/codelldb',
    args = {"--port", "${port}"}
  },
}

local get_args = function()
  -- 获取输入命令行参数
  local cmd_args = vim.fn.input('CommandLine Args:')
  local params = {}
  -- 定义分隔符(%s在lua内表示任何空白符号)
  local sep = "%s"
  for param in string.gmatch(cmd_args, "[^%s]+") do
    table.insert(params, param)
  end
  return params
end;

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'launch file',
    -- 此处指向当前文件
    program = '${file}',
    args = get_args,
    pythonpath = function()
      return '/usr/bin/python'
    end,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  }
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
