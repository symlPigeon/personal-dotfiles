local mason = require("mason")
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local mason_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status then
    vim.notify("mason-lspconfig not found", vim.log.levels.ERROR)
    return
end

mason_lspconfig.setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "csharp_ls",
        "cssls",
        "dockerls",
        "html",
        "jsonls",
        "sumneko_lua",
        "pyright",
        "yamlls",
        "ltex",
        "jdtls",
        "tsserver",
        "kotlin_language_server",
        "marksman",
        "sqls"
    },
    automatic_installation = true
})

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    vim.notify("lspconfig not found", vim.log.levels.ERROR)
    return
end

mason_lspconfig.setup_handlers({
    function(server_name)
        local opts = require("lsp.config.common")
        lspconfig[server_name].setup(opts)
    end,
    ["sumneko_lua"] = function()
        local opt = require("lsp.config.lua")
        lspconfig.sumneko_lua.setup(opt)
    end,
    ["cssls"] = function()
        local opt = require("lsp.config.css")
        lspconfig.cssls.setup(opt)
    end,
})
