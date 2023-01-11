vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    -- update diagnostic also in insert mode, may affect performance
    update_in_insert = true
})

local signs = {
    Error = " ", Warn = " ", Hint = " ", Info = " "
}

for type, icon in pairs(signs) do
    local hl = "Diagnostic" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lspkind
local lspkind = require('lspkind')
lspkind.init({
    mode = 'symbol_text',
    preset = 'codicons',
    symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
    }
})

local M = {}
M.formatting = {
    format = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        before = function(entry, vim_item)
            vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
            return vim_item
        end
    })
}

local lspsaga = require('lspsaga')
lspsaga.init_lsp_saga({
    border_style = "single",
    saga_winblend = 0,
    move_in_saga = { prev = "<C-p>", next = "<C-n>" },
    diagnostic_header = { " ", " ", " ", " " },
    max_preview_lines = 10,
    code_action_icon = " ",
    code_action_num_shortcut = true,
    code_action_lightbulb = {
        enable = true,
        enable_in_insert = true,
        cache_code_action = true,
        sign = true,
        update_time = 150,
        sign_priority = 20,
        virtual_text = true
    },
    -- finder icons
    finder_icons = {
        def = '  ',
        ref = '諭 ',
        link = '  ',
    },
    -- finder do lsp request timeout
    -- if your project big enough or your server very slow
    -- you may need to increase this value
    finder_request_timeout = 1500,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    definition_action_keys = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>i',
        tabe = '<C-c>t',
        quit = 'q',
    },
    rename_action_quit = "<C-c>",
    rename_in_select = true,
    -- show symbols in winbar must nightly
    symbol_in_winbar = {
        in_custom = false,
        enable = true,
        separator = ' ',
        show_file = true,
        -- define how to customize filename, eg: %:., %
        -- if not set, use default value `%:t`
        -- more information see `vim.fn.expand` or `expand`
        -- ## only valid after set `show_file = true`
        file_formatter = "",
        click_support = false,
    },
    -- show outline
    show_outline = {
        win_position = 'right',
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
        -- auto refresh when change buffer
        auto_refresh = true,
    },
    -- custom lsp kind
    -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
    custom_kind = {},
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
})

return M
