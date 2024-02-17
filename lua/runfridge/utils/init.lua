-- Check if directory is Git
function IsGitRepo()
    -- Use 'git rev-parse --is-inside-work-tree' to check if the current directory is inside a Git work tree
    local handle = io.popen('git rev-parse --is-inside-work-tree 2>/dev/null')
    if (handle ~= nil) then
        local result = handle:read("*a")
        handle:close()
        -- The command returns 'true' if inside a Git repo, so we trim the result and compare
        return result:find('true') ~= nil
    end
    return nil
end
