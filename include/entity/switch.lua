local function init(parent)
    local switch = setmetatable({}, parent)
    
    switch.g_link = switch:getGlobal("link")
    
    switch:has("position", "sprite", "collider", "sfx")
    
    switch.sfx:new("switch7", "switch8")
    
    switch.sprite:setSprite("switch-black")
    switch.sprite:register(switch, 3)
    
    switch.collider:setType("rectangle", 4, 4)
    switch.collider:collidesWith("player")
    
    switch.collider:setFunctionOn("player", function(self, other, hit, is_repeat)
            if not is_repeat then
                local link = switch.g_link[self.link]
                switch.g_link[self.link] = not link
                self.sfx:play(link and "switch8" or "switch7", false)
                self.sprite:setSprite(link and "switch-black" or "switch-green")
            end
        end
    )
    
    switch.collider:setFunctionOff("player", function(self)
        end
    )
    
    return switch
end
return init