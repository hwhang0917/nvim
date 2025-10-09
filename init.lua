-- Store the original deprecate function
local original_deprecate = vim.deprecate

-- List of deprecation warnings to suppress
local suppress_deprecations = {
    'lspconfig',
    -- Add more patterns here as needed
    -- 'some_other_plugin',
    -- 'another_warning',
}

-- Override vim.deprecate to skip warnings matching our list
vim.deprecate = function(name, alternative, version, plugin, backtrace)
    if name then
        for _, pattern in ipairs(suppress_deprecations) do
            if name:match(pattern) then
                return
            end
        end
    end
    original_deprecate(name, alternative, version, plugin, backtrace)
end

require("runfridge.launch")
require("runfridge.core.settings")
require("runfridge.core.keymap")
require("runfridge.core.autocmd")
require("runfridge.lazy")
