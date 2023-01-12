local packer = require("packer")
packer.startup({
    function(use)
        -- plugin manager
        use("wbthomason/packer.nvim")
        -- -- plugins
        -- theme
        use("shaunsingh/moonlight.nvim")
        use {
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
        }

        use("numToStr/Comment.nvim")
    end,
    config = {
        max_jobs = 16,
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s"
        },
        display = {
            open_fn = function()
                return require("packer.util").float({
                    border = "single"
                })
            end
        }
    }
})

-- auto install plugins on saving this file
pcall(vim.cmd, [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]])
