-- Check if directory is Git
function IsGitRepo()
	-- Use 'git rev-parse --is-inside-work-tree' to check if the current directory is inside a Git work tree
	local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
	if handle ~= nil then
		local result = handle:read("*a")
		handle:close()
		-- The command returns 'true' if inside a Git repo, so we trim the result and compare
		return result:find("true") ~= nil
	end
	return nil
end

-- Merge Tables
function MergeTable(table1, table2)
	local result = {}
	for key, value in pairs(table1) do
		result[key] = value
	end
	for key, value in pairs(table2) do
		result[key] = value
	end
	return result
end

-- Noice or vim notify
function Notify(title, text, level, timeout)
    level = level or "info"
    timeout = timeout or 1000

	local message = title and (title .. ": " .. text) or text
	local ok, noice = pcall(require, "noice")
	if ok then
		noice.notify(text, level, {
			title = title,
			timeout = timeout
		})
	else
		local vim_level = vim.log.levels.INFO
		if level == "error" then
			vim_level = vim.log.levels.ERROR
		elseif level == "warn" then
			vim_level = vim.log.levels.WARN
		end

		vim.notify(message, vim_level)
	end
end

-- Get the current Operating System
function GetOS()
    local os_name = vim.uv.os_uname().sysname:lower()
    if os_name:find("windows") then
        return "windows"
    elseif os_name:find("linux") then
        return "linux"
    elseif os_name:find("darwin") then
        return "macos"
    else
        return "unknown"
    end
end
