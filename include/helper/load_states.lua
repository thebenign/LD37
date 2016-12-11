local files = love.filesystem.getDirectoryItems("/include/state/")

local state_scripts = {}

for i, v in ipairs(files) do
    local name = string.match(v, "[%w_-]+")
    state_scripts[name] = require(name)
end

return state_scripts