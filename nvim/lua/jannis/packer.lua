vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Rose-pine theme
    use ({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    -- Treesitter
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use ('ThePrimeagen/harpoon')
    use ('mbbill/undotree')
    use ('tpope/vim-fugitive')

    -- LSP and completion
    use ('neovim/nvim-lspconfig')
    use ('williamboman/mason.nvim')
    use ('williamboman/mason-lspconfig.nvim')
    use ('hrsh7th/nvim-cmp')
    use ('hrsh7th/cmp-nvim-lsp')
    use ('hrsh7th/cmp-buffer')
    use ('hrsh7th/cmp-path')
    use ('saadparwaiz1/cmp_luasnip')
    use ('L3MON4D3/LuaSnip')
    use ('rafamadriz/friendly-snippets')

    -- pair brackets, string etc
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use ("folke/tokyonight.nvim")
    use {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    }
    use {
        "ellisonleao/gruvbox.nvim",
        as = "gruvbox",
    }
    use ('simrat39/rust-tools.nvim')
    use {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require('nvim-web-devicons').setup { default = true }
        end
    }
    use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      {
        's1n7ax/nvim-window-picker',
        version = '2.*',
        config = function()
            require 'window-picker'.setup({
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { 'terminal', "quickfix" },
                    },
            },
        })
        end,
      },
    },
    }

end)



