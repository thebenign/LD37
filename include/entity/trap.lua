local function init(parent)
    local trap = setmetatable({}, parent)
    
    trap:has("position", "sprite", "collider")
    
    trap.sprite:setSprite("trap-open")
    trap.sprite:register(trap, 2)
    
    trap.collider:setType("rectangle", 32, 32)
    
    trap.update = function(self)
        if self.global.link[self.link] then
            self.collider.active = false
            self.sprite:setSprite("trap-closed")
        else
            self.collider.active = true
            self.sprite:setSprite("trap-open")
        end
    end
    
    return trap
end
return init