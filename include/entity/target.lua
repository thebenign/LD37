local function init(parent)
    local target = setmetatable({}, parent)
    
    target:has("position","sprite","collider", "timer")
    
    target.sign = -1
    target.origin_y = 0
    target.timer:set(120, true)
    
    target.sprite:setSprite("selection")
    target.sprite:register(target, 5)
    --target.sprite.blend = "add"
    
    target.collider:setType("rectangle", 32,32)
    
    target.timer.call = function(self)
        self.origin_y = 0
    end
    
    target.update = function(self)
        self.origin_y = self.origin_y + (math.pi*2)/120
        self.sprite:setOrigin(0, math.cos(self.origin_y)+2)
    end
    
    
    return target
end
return init