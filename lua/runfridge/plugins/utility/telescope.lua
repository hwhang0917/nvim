return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = vim.fn.executable("make") == 1 and "make"
                or vim.fn.executable("cmake") == 1
                    and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
                or nil,
            enabled = vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1,
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
