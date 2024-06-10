-- Utilities
Add 'runfridge.plugins.persistence'
Add 'runfridge.plugins.tpope'
Add 'runfridge.plugins.telescope'
Add 'runfridge.plugins.markdown-preview'
Add 'runfridge.plugins.zen'
Add 'runfridge.plugins.harpoon'
-- Theme
Add 'runfridge.plugins.tokyonight'
Add 'runfridge.plugins.web-devicons'
Add 'runfridge.plugins.illuminate'
-- Interface
Add 'runfridge.plugins.noice'
Add 'runfridge.plugins.lualine'
Add 'runfridge.plugins.nvim-tree'
Add 'runfridge.plugins.blamer'
Add 'runfridge.plugins.indent-blankline'
-- Code Syntax & LSP
Add 'runfridge.plugins.treesitter'
Add 'runfridge.plugins.lsp'
Add 'runfridge.plugins.conform'
Add 'runfridge.plugins.copilot'
-- Misc
Add 'runfridge.plugins.wakatime'
Add 'runfridge.plugins.garbage'
Add 'runfridge.plugins.plenary'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(PLUGIN_SPECS, {
    ui = {
        border = 'single',
    },
    change_detection = {
        enabled = false,
        notify = false
    }
})
