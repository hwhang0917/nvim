-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Github Copilot
    use('github/copilot.vim')

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-tree/nvim-web-devicons'}
        },
    }

    -- Nvim Tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    }

    -- BarBar
    use {
        'romgrk/barbar.nvim',
        requires = {
            {'nvim-tree/nvim-web-devicons'},
            {'lewis6991/gitsigns.nvim'}
        }
    }

    -- Treesitter (Only for Non-Windows)
    if (vim.loop.os_uname().sysname ~= 'Windows_NT') then
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

    -- Indent Guide
    use('nathanaelkane/vim-indent-guides')

    -- Undotree
    use('mbbill/undotree')

    -- Vim Fugitive
    use('tpope/vim-fugitive')

    -- Vim Git Gutter
    use('airblade/vim-gitgutter')

    -- Vim Blamer
    use('APZelos/blamer.nvim')

    -- Vim Surround
    use('tpope/vim-surround')

    -- Vim Commentary
    use('tpope/vim-commentary')

    -- Vim Rzip
    use('lbrayner/vim-rzip')

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

    -- VSCode Codicon
    use('mortepau/codicons.nvim')

    -- Prettier
    use {
        'prettier/vim-prettier',
        run = 'yarn install --frozen-lockfile --production'
    }

    -- Zenmode
    use("folke/zen-mode.nvim")

    -- WakaTime
    use('wakatime/vim-wakatime')

    -- Emmet
    use('mattn/emmet-vim')

    -- Colorizer
    use('chrisbra/colorizer')
end)
