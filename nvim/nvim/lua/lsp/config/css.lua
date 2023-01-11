local opts = require("lsp.config.common")
local capabilities = vim.lsp.protocol.make_client_capabilities()

opts.capabilities = capabilities

return opts
