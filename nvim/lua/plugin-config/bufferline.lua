local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("bufferline not found", vim.log.levels.WARN)
    return
end

-- configure
bufferline.setup({
    options = {
        -- close tab
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        -- sidebar configure
        offsets = {
            {
                filetype = "NvimTree",
                text = "FileExplorer",
                highlight = "Directory",
                text_align = "left"
            }
        },
        -- nvim built-in lsp
        diagnostics = "nvim_lsp",
        -- lsp error icon
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end

    }
})
