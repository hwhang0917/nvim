return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
    },
    cmd = "Telescope",
    config = function()
        require("telescope").setup({
            defaults = {
                disable_devicons = false,
                path_display = { "truncate" },
            },
        })
    end,
}
