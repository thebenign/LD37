local function init(parent)
    local ice = setmetatable({}, parent)
    
    ice:has("position", "sprite", "collider", "sfx")
    ice.sfx:new("steam-hiss")
    ice.sfx:setVolume("steam-hiss", .3)
    ice.sprite:setSprite("ice_small")
    --ice.sprite:setOrigin(16,16)
    ice.sprite:register(ice, 4)
    ice.collider:setType("rectangle", 16, 16)
    ice.collider:setOffset(-8,-8)
    ice.collider:collidesWith("map", "warn", "fire")
    ice.collider:stoppedBy("map", "warn")
    
    ice.collider:setFunctionOn("fire", function(self, other)
            self.sfx:play("steam-hiss", false)
            other:destroy()
            self:destroy()
        end
    )
    
    
    return ice
end

return init