local function load_map(name)
    if not love.filesystem.isFile("/assets/maps/"..name..".lua") then
        name = "end"
    end
    local f = "assets.maps."..name
    local map = require(f)
    
    local tilesets = {}
    for i, v in ipairs(map.tilesets) do
        if v.image then
            tilesets[i] = love.graphics.newImage("assets/maps/"..v.image)
        end
    end
    
    
    return {map = map, tilesets = tilesets}
end

return load_map