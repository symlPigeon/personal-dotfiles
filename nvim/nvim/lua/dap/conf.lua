-- setup DAPInstall Plugin
--[[local dap_install_status, dap_install = pcall(require, "dap-install")
if not dap_install_status then
    vim.notify("dap-install not found", vim.log.levels.WARN)
else
    dap_install.setup({
        installationpath = vim.fn.stdpath("data") .. "/dapinstall/",
    })
end]]--

local dap_status, dap = pcall(require, "dap")
if not dap_status then
    vim.notify("dap not found", vim.log.levels.WARN)
    return
end

local dapui_status, dapui = pcall(require, "dapui")
if not dapui_status then
    vim.notify("dapui not found", vim.log.levels.WARN)
    return
end

local dap_virtual_text_status, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_status then
    vim.notify("nvim-dap-virtual-text not found", vim.log.levels.WARN)
    return
end

dap_virtual_text.setup({
    commented = true,
})

vim.fn.sign_define("DapBreakpoint", {
    text = "🛑",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
})

vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
})

vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
})

require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40, -- 40 columns
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
    controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = true,
        -- Display controls in this element
        element = "repl",
        icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "↻",
            terminate = "□",
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
    }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.before_event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.before_event_exited["dapui_config"] = function()
    dapui.close()
end

require("keybindings").mapDAP()
