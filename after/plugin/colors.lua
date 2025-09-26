local M = {}

M.config = {
  theme = "catppuccin",
  flavour = "mocha", -- "latte", "frappe", "macchiato", "mocha"
  transparent = true, -- Default transparency state
}

--- Applies the colorscheme and related plugin settings.
-- This function is the single source of truth for setting up the theme.
-- It leverages catppuccin's built-in features for transparency and customizations,
-- which is more reliable than manually setting highlight groups.
function M.apply()
  -- Configure the catppuccin plugin
  require("catppuccin").setup({
    flavour = M.config.flavour,
    transparent_background = M.config.transparent,
    show_end_of_buffer = true, -- Show filler lines at the end of the buffer
    term_colors = true,

    -- A cleaner way to customize highlight groups.
    -- This uses the theme's own color palette for consistency.
    custom_highlights = function(colors)
      return {
        -- Use a subtle color from the theme for line numbers
        LineNr = { fg = colors.surface2 },
      }
    end,

    -- Let catppuccin handle styling for other plugins.
    -- This ensures a consistent look and feel across your UI.
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      notify = true,
      treesitter = true,
      -- Add any other supported plugins you use here
    },
  })

  -- Load the colorscheme
  vim.cmd.colorscheme(M.config.theme)

  -- The catppuccin integration for nvim-notify is excellent, but if you
  -- still prefer a pure black background, you can override it here.
  -- Comment this out to use the default catppuccin style for notifications.
  require("notify").setup({
    background_colour = "#000000",
  })
end

--- Toggles the transparency on and off.
-- This function simply flips the state and re-applies the theme.
function M.toggle_transparency()
  M.config.transparent = not M.config.transparent
  M.apply()
end

-- Use the modern and recommended vim.keymap.set API.
-- It's cleaner and allows for a description to be added, which can
-- be displayed by plugins like which-key.
vim.keymap.set("n", "<leader>tt", M.toggle_transparency, {
  noremap = true,
  silent = true,
  desc = "Toggle theme transparency",
})

-- Apply the theme configuration when this file is loaded.
M.apply()

return M
