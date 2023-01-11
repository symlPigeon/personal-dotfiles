local status, fidget = pcall(require, 'fidget')
if not status then
    vim.notify('fidget not installed', vim.log.levels.WARN)
    return
end

fidget.setup({
    sources = {
        ["null-ls"] = {
            ignored = true
        }
    }
})
