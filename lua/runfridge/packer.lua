-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-tree/nvim-web-devicons'}
        },
    }

    -- Treesitter (Only for Non-Windows)
    if (vim.fn.has('macunix')) then
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end
        }
    end

    -- Tokyo Night Theme
    use {
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            vim.cmd.colorscheme('tokyonight-moon')
        end
    }

    -- Harpoon
    use('theprimeagen/harpoon')

    -- Undotree
    use('mbbill/undotree')

    -- Vim Fugitive
    use('tpope/vim-fugitive')

    -- Vim Surround
    use('tpope/vim-surround')

    -- Vim Commentary
    use('tpope/vim-commentary')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Prettier
    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    -- Zenmode
    use("folke/zen-mode.nvim")

    -- WakaTime
    use('wakatime/vim-wakatime')
end)
