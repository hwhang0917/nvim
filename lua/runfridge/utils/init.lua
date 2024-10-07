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
