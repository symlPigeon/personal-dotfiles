local opts = {
    settings = {},
    flags = {
        debounce_text_changes = 150
    },
    on_attach = function(client, bufnr)
        -- disable formatting
        --client.server_capabilities.documentFormattingProvider = false
        --client.server_capabilities.document_range_formatting = false

        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        -- hotkeys
        require('keybindings').mapLSP(buf_set_keymap)
        -- format on save
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end
}

return opts
