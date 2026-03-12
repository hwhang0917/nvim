local M = {}

function M.is_git_repo()
	return vim.fn.finddir(".git", ".;") ~= ""
end

function M.notify(title, text, level, timeout)
	level = level or "info"
	timeout = timeout or 1000

	local message = title and (title .. ": " .. text) or text
	local ok, noice = pcall(require, "noice")
	if ok then
		noice.notify(text, level, {
			title = title,
			timeout = timeout,
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

function M.get_os()
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

return M
