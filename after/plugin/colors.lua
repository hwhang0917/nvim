-- Reset Colorscheme
function RCS(color)
	color = color or 'tokyonight-moon'
	vim.cmd.colorscheme(color)

    -- Transparent Background
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })

    -- Line Number Color
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'gray' })
end

-- Transform Toggle
IsToggled = true

-- Toggle Transparent ~ Opaque Background
function TOB(color)
    if (IsToggled)
        then
            color = color or 'tokyonight-moon'
            vim.cmd.colorscheme(color)
        else
            RCS()
        end
        IsToggled = not IsToggled
    end

-- Make toggle keybinding
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua TOB()<CR>", { noremap = true, silent = true })

-- Defaults to transparent background
RCS()
