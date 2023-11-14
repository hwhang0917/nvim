-- Reset Colorscheme
function RCS(color)
	color = color or 'tokyonight-moon'
	vim.cmd.colorscheme(color)

    -- Transparent Background
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

    -- Line Number Color
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'gray' })
end

RCS()
