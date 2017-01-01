local function init(parent)
    local map = setmetatable({}, parent)
    
    map:has("map", "position", "sprite", "collider", "timer")
    
    map.room = map:getGlobal("room") or 1
    map:setGlobal("link", {})
    
    map.map:new(tostring(map.room))
    map.collider:setType("map")
    map.sprite:setMap()
    
    for i, v in ipairs(map.map.objects) do
        local obj = map.new(v.name)
        for k, v in pairs(v.properties) do
            obj[k] = v
            if k == "link" then
                local link = map:getGlobal("link")
                link[v] = false
            end
        end
        if not obj.ignore_position then
            obj.position:set(v.x, v.y)
        end
    end
    
    map.update = function(self)
        if self:getGlobal("swap") then
            local room = map.room
            self:clearGlobals()
            self:setGlobal("room", room + 1)
            self:clearEverything()
        end
    end
    
    
    map.timer:set(10, true)
    
    map.timer.call = function(self)
        self.new("butterfly")
    end
    
    return map
end

return init