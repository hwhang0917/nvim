return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = { theme = 'tokyonight' },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        }
    end
}
