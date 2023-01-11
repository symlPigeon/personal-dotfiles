local packer = require("packer")
packer.startup({
    function(use)
        -- plugin manager
        use("wbthomason/packer.nvim")
        -- -- plugins
        -- theme
        use("shaunsingh/moonlight.nvim")
        -- file explorer
        use({
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons'
            },
            tag = 'nightly' -- optional, updated every week.
        })
        -- tab bar
        use({
            'akinsho/bufferline.nvim',
            tag = "v2.*",
            requires = {
                'kyazdani42/nvim-web-devicons',
                'moll/vim-bbye'
            }
        })
        -- search
        use({
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            requires = {
                {
                    'nvim-lua/plenary.nvim'
                }
            }
        })
        -- vim surround
        use("ur4ltz/surround.nvim")
        -- vim toggleterm
        use("akinsho/toggleterm.nvim")
        -- comment enhancements
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
