local function init(parent)
    local map = setmetatable({}, parent)
    
    map:has("map", "position", "sprite", "collider")
    
    map.map:new("1")
    map.collider:setType("map")
    
    map.sprite:setMap()
    
    return map
end

return init