local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    vim.notify("mason-null-ls not found", vim.log.levels.WARN)
    return
end

mason_null_ls.setup()
