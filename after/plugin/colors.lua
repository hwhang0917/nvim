local default_theme = "rose-pine"
local default_transparency = true

-- custom status line
local os_icons = { Windows_NT = "", Linux = "", Darwin = "" }
local os_icon = os_icons[vim.uv.os_uname().sysname] or "💀"
vim.opt.laststatus = 2
vim.opt.statusline = " %f %m %= %l:%c " .. os_icon .. " "

vim.cmd.colorscheme(default_theme)
-- require("catppuccin").setup({ flavour = "mocha" })
require("rose-pine").setup({
    -- variant = "dawn",
    highlight_groups = {
        StatusLine = { fg = "iris", bg = "iris", blend = 10 },
        StatusLineNC = { fg = "subtle", bg = "surface" },
    },
})

-- Reset Colorscheme
function RCS(color)
    color = color or default_theme
    vim.cmd.colorscheme(color)

    -- Transparent Background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })

    -- Line Number Color
    vim.api.nvim_set_hl(0, "LineNr", { fg = "gray" })
end

-- Transparent Toggle
local IsToggled = default_transparency

-- Toggle Transparent ~ Opaque Background
function TOB(color)
    if IsToggled then
        color = color or default_theme
        vim.cmd.colorscheme(color)
    else
        RCS()
    end
    IsToggled = not IsToggled
end

-- Make toggle keybinding
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua TOB()<CR>", { noremap = true, silent = true })

-- Defaults to transparent background
if default_transparency then
    RCS()
end

require("notify").setup({ background_colour = "#000000" })
