return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('tokyonight').setup({
            style = "storm",
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
            }
        })
    end
}
