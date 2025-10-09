-- Import utility functions
require("runfridge.utils.init")

PLUGIN_SPECS = {}

function Add(plugin)
    table.insert(PLUGIN_SPECS, { import = plugin })
end
