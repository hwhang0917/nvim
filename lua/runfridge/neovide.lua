if vim.g.neovide then
    -- Font
    vim.o.guifont = "FiraCode Nerd Font,D2Codingligature Nerd Font:h18"

    -- Meta - Alt mapping
    vim.g.neovide_input_macos_alt_is_meta = true

    -- Transparent background
    local alpha = function()
        return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
    end
    vim.g.neovide_transparency = 0.0
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#0f1117" .. alpha()

    -- Copy and Paste
    vim.keymap.set('n', '<D-c>', '"+y')
    vim.keymap.set('n', '<D-v>', '"+P')
    vim.keymap.set('v', '<D-v>', '"+P')
    vim.keymap.set('c', '<D-v>', '<C-R>+')
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')
end
