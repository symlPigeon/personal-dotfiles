-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- local variable
local map = vim.api.nvim_set_keymap
-- reuse opt
local opt = {
    noremap = true,
    silent = true
}
-- plugin hotkeys
local pluginKeys = {}

-- -- window manage
-- hotkey for spilt screen
map("n", "<leader>sv", ":vsp<CR>", opt)
map("n", "<leader>sh", ":sp<CR>", opt)
-- close current window
map("n", "<leader>sc", "<C-w>c", opt)
-- close other window
map("n", "<leader>so", "<C-w>o", opt)
-- alt + hjkl to move between windows
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<A-Left>", "<C-w>h", opt)
map("n", "<A-Down>", "<C-w>j", opt)
map("n", "<A-Up>", "<C-w>k", opt)
map("n", "<A-Right>", "<C-w>l", opt)
-- resize windows
-- vertically
map("n", "<leader><C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<leader><C-right>", ":vertical resize +2<CR>", opt)
map("n", "<leader>s,", ":vertical resize -20<CR>", opt)
map("n", "<leader>s.", ":vertical resize +20<CR>", opt)
-- hortizontally
map("n", "<leader><C-up>", ":resize -2<CR>", opt)
map("n", "<leader><C-down>", ":resize +2<CR>", opt)
map("n", "<leader>sj", ":resize +10<CR>", opt)
map("n", "<leader>sk", ":resize -10<CR>", opt)
-- same ratio
map("n", "<leader>s=", "<C-w>=", opt)

-- -- Terminal
map("n", "<leader>t", ":sp | terminal fish<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal fish<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<A-Left>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-Down>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-Up>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-Right>", [[ <C-\><C-N><C-w>l ]], opt)

-- code indent
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- move selected lines up and down
map("v", "J", ":m '>+1<CR>gv-gv", opt)
map("v", "K", ":m '<-2<CR>gv-gv", opt)

-- view code
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-Up>", "9k", opt)
map("n", "<C-Down>", "9j", opt)

-- Insert mode
map("i", "<C-h>", "<Esc>I", opt)
map("i", "<C-j>", "<Esc>A", opt)

-- nvim-tree
-- open/close NvimTree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- nvim tree hotkeys
pluginKeys.nvimTreeList = { -- open file or folder
    {
        key = {
            "<CR>",
            "o",
            "<2-LeftMouse>"
        },
        action = "edit"
    }, -- open file in splited window
    {
        key = "v",
        action = "vsplit"
    },
    {
        key = "h",
        action = "split"
    }, -- toggle hidden files
    {
        key = "h",
        action = "toggle_custom"
    },
    {
        key = ".",
        action = "toggle_dotfiles"
    }, -- file operations
    {
        key = "<F5>",
        action = "refresh"
    },
    {
        key = "a",
        action = "create"
    },
    {
        key = "d",
        action = "remove"
    },
    {
        key = "r",
        action = "rename"
    },
    {
        key = "x",
        action = "cut"
    },
    {
        key = "c",
        action = "copy"
    },
    {
        key = "p",
        action = "paste"
    },
    {
        key = "s",
        action = "system_open"
    }
}

-- bufferline
-- switch between tabs
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-Left>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-Right>", ":BufferLineCycleNext<CR>", opt)
-- close tab
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>cl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>ch", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>cc", ":BufferLinePickClose<CR>", opt)

-- telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
pluginKeys.telescopeList = {
    i = { -- hotkeys in insert mode
        -- move
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- history
        ["<C-p>"] = "cycle_history_prev",
        ["<C-n>"] = "cycle_history_next",
        -- close window
        ["<C-c>"] = "close",
        -- move preview window
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down"
    }
}

-- lsp
pluginKeys.mapLSP = function(keymap)
    -- rename
    keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
    -- code action
    keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
    -- goto
    keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
    -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
    keymap("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
    -- diagnostics
    keymap("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    keymap("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
    keymap("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
    -- formatting
    keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opt)
    -- other functions
    keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)

end

-- nvim-cmp auto completion
pluginKeys.cmp = function(cmp)
    --local has_words_before = function()
    --    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    --end

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    return {
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({
                        behavior = cmp.SelectBehavior.Select
                    })
                else
                    cmp.confirm()
                end
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
                --elseif has_words_before() then
                --    cmp.complete()
            else
                fallback()
            end
        end, {
            "i",
            "s",
            "c"
        }),
        ["<Esc>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback()
            end
        end, { "i", "s", "c" }),
    }
end

-- gitsigns
pluginKeys.gitsigns_on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<leader>gj', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
    end, { expr = true })

    map('n', '<leader>gk', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
    end, { expr = true })

    -- Actions
    map({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gS', gs.stage_buffer)
    map('n', '<leader>gu', gs.undo_stage_hunk)
    map('n', '<leader>gR', gs.reset_buffer)
    map('n', '<leader>gp', gs.preview_hunk)
    map('n', '<leader>gb', function() gs.blame_line { full = true } end)
    map('n', '<leader>gtb', gs.toggle_current_line_blame)
    map('n', '<leader>gd', gs.diffthis)
    map('n', '<leader>gD', function() gs.diffthis('~') end)
    map('n', '<leader>gtd', gs.toggle_deleted)

    -- Text object
    map({ 'o', 'x' }, '<leader>ig', ':<C-U>Gitsigns select_hunk<CR>')
end

pluginKeys.mapDAP = function()
    -- start
    map("n", "<F5>", ":lua require('dap').continue()", opt)
    -- stop
    map(
        "n",
        "<leader>de",
        ":lua require'dap'.close()<CR>"
        .. ":lua require'dap'.terminate()<CR>"
        .. ":lua require'dap.repl'.close()<CR>"
        .. ":lua require'dapui'.close()<CR>"
        .. "<C-w>o<CR>",
        opt
    )
    -- set breakpoint
    map("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", opt)
    map("n", "<leader>dT", ":lua require('dap').clear_breakpoints()<CR>", opt)
    map("n", "<leader>db", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opt)
    map("n", "<leader>dB", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opt)
    --  stepOver, stepOut, stepInto
    map("n", "<F10>", ":lua require'dap'.step_over()<CR>", opt)
    map("n", "<F12>", ":lua require'dap'.step_out()<CR>", opt)
    map("n", "<F11>", ":lua require'dap'.step_into()<CR>", opt)
    -- eval
    map("n", "<leader>dh", ":lua require'dapui'.eval()<CR>", opt)
end

return pluginKeys
