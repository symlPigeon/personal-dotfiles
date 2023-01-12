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
        -- status bar
        use({
            'nvim-lualine/lualine.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons',
                opt = true
            }
        })
        -- status bar with lsp
        use("arkav/lualine-lsp-progress")
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
        -- dashboard
        use("glepnir/dashboard-nvim")
        -- project manager
        use("ahmedkhalf/project.nvim")
        -- language hightlight
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        })
        -- LSP
        use({
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig"
        })
        -- auto completion
        use("hrsh7th/nvim-cmp")
        use("hrsh7th/vim-vsnip")
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        use("rafamadriz/friendly-snippets")
        -- pair completion
        use({
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        })
        -- better lsp completion ui, more icons
        use("onsails/lspkind-nvim")
        -- indentation guides
        use("lukas-reineke/indent-blankline.nvim")
        -- github copilot
        use("github/copilot.vim")
        -- lsp enhancements
        use("glepnir/lspsaga.nvim")
        -- winbar
        use("b0o/incline.nvim")
        -- null-ls
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        -- bridge between null-ls and mason
        use("jayp0521/mason-null-ls.nvim")
        -- fidget, a lsp frontend indicator
        use("j-hui/fidget.nvim")
        -- gitsigns
        use("lewis6991/gitsigns.nvim")
        -- vim surround
        use("ur4ltz/surround.nvim")
        -- vim toggleterm
        use("akinsho/toggleterm.nvim")
        -- comment enhancements
        use("numToStr/Comment.nvim")
        -- notify
        use("rcarriga/nvim-notify")
        -- nvim-dap
        use("mfussenegger/nvim-dap")
        use("theHamsta/nvim-dap-virtual-text")
        -- dap-buddy.nvim
        use("Pocco81/DAPInstall.nvim")
        use("rcarriga/nvim-dap-ui")
        -- Mason DAP bridge
        use("jayp0521/mason-nvim-dap.nvim")
        -- easy motion replacement
        use {
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
        }



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
