local status, null_ls = pcall(require, "null-ls")
if not status then
    vim.notify("null-ls not found", vim.log.levels.ERROR)
    return
end

local formatting = null_ls.builtins.formatting

local async_formatting = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        vim.lsp.util.make_formatting_params({}),
        function(err, res, ctx)
            if err then
                local err_msg = type(err) == "string" and err or err.msg
                vim.notify("Formatting error: " .. err_msg, vim.log.levels.WARN)
                return
            end
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                return
            end
            if res then
                local client = vim.lsp.get_client_by_id(ctx.client_id)
                vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent noautocmd update")
                end)
            end
        end
    )
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    debug = false,
    sources = {
        formatting.black,
        formatting.clang_format,
        formatting.cmake_format,
        formatting.eslint,
        formatting.fixjson,
        formatting.latexindent,
        formatting.lua_format,
        formatting.markdownlint,
        formatting.prettier,
    },
    prefer_local = "node_modules/.bin",
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePost", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    async_formatting(bufnr)
                end,
            })
        end
    end
})
