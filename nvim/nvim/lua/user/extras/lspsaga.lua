local M = {
    "nvimdev/lspsaga.nvim"
}

function M.config()
    require("lspsaga").setup({})
    local opts = {
        noremap = true,
        silent = true
    }
    local keymap = vim.keymap.set

    keymap("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
    keymap("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opts)
    keymap("n", "gf", "<cmd>Lspsaga finder<cr>", opts)
    keymap("n", "gp", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
    keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    keymap("n", "gD", "<cmd>Lspsaga goto_definition<cr>", opts)
    keymap("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
    keymap("n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
    keymap("n", "gs", "<cmd>Lspsaga outline<cr>", opts)
    keymap("n", "goc", "<cmd>Lspsaga outgoing_calls<cr>", opts)
    keymap("n", "gic", "<cmd>Lspsaga incoming_calls<cr>", opts)

end

return M
