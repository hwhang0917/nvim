-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Install only for non-Windows platform
    if (vim.loop.os_uname().sysname ~= 'Windows_NT') then
        -- Treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end
        }
    end

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    }

    -- FZF
    use {
        "junegunn/fzf",
        run = function()
            vim.fn['fzf#install']()
        end
    }

    -- Github Copilot
    use('github/copilot.vim')

    -- Git Blame
    use('f-person/git-blame.nvim')

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-tree/nvim-web-devicons' }
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
            { 'nvim-tree/nvim-web-devicons' },
            { 'lewis6991/gitsigns.nvim' }
        }
    }

    -- Tokyo Night Theme
    use {
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            vim.cmd.colorscheme('tokyonight-moon')
        end
    }

    -- Vim Markdown Preview
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        setup = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { 'markdown' }
    }

    -- Indent Guide
    use('nathanaelkane/vim-indent-guides')

    -- Undotree
    use('mbbill/undotree')

    -- Vim Fugitive
    use('tpope/vim-fugitive')

    -- Vim Git Gutter
    use('airblade/vim-gitgutter')

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
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- Conform formatter
    use {
        'stevearc/conform.nvim',
        config = function()
            require('conform').setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = { { "prettier" } },
                    typescript = { { "prettier" } },
                    javascriptreact = { { "prettier" } },
                    typescriptreact = { { "prettier" } },
                    json = { { "prettier" } },
                    graphql = { { "prettier" } },
                    markdown = { { "prettier" } },
                    html = { "htmlbeautifier" },
                    bash = { "beautysh" },
                    yaml = { "yamlfix" },
                    css = { { "prettier" } },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                }
            })
        end
    }

    -- Illuminate
    use {
        'RRethy/vim-illuminate',
        config = function()
            require('illuminate').configure()
        end
    }

    -- VSCode Codicon
    use('mortepau/codicons.nvim')

    -- Zenmode
    use("folke/zen-mode.nvim")

    -- WakaTime
    use('wakatime/vim-wakatime')

    -- Emmet
    use('mattn/emmet-vim')

    -- Colorizer
    use('chrisbra/colorizer')
end)
