return {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
        -- Milliseconds to wait before restoring LSP after the mouse re-enters nvim
        wakeup_delay = 0,
        -- Seconds to wait before stopping all LSP clients after neovim loses focus
        grace_period = 60 * 30,
    }
}
