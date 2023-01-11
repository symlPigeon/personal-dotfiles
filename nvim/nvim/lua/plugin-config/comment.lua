local status, comment = pcall(require, "Comment")
if not status then
    vim.notify("Comment plugin not found", vim.log.levels.WARN)
    return
end

comment.setup({})
