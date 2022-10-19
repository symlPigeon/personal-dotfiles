local status, mason_dap = pcall(require, "mason-nvim-dap")
if not status then
    vim.notify("mason-nvim-dap not found", vim.log.levels.WARN)
    return
end

mason_dap.setup({

})
