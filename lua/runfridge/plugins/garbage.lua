return {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
        -- Milliseconds to wait before restoring LSP after the mouse re-enters nvim
        wakeup_delay = 500
    }
}
