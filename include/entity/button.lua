local function init(parent)
    local button = setmetatable({}, parent)
    
    button:has("position", "sprite", "collider", "sfx")
    
    button.sfx:new("switch36", "switch29")
    
    button.collider:setType("rectangle", 32, 32)
    button.collider:collidesWith("player", "ice")
    
    button.collider:setFunctionOn({"player", "ice"}, function(self, other, hit, is_repeat)
            local only = true
            for k, v in pairs(self.collider.last) do
                if k ~= other then only = false end
            end
            
            if only and not is_repeat then
                self.global.link[self.link] = true
                self.sprite:setSprite("button-down")
                self.sfx:play("switch29", false)
            end
            
        end
    )
    button.collider:setFunctionOff({"player", "ice"}, function(self, other)
            
            local empty = true
            for k, v in pairs(self.collider.last) do
                if k ~= other then empty = false end
            end
            if empty then
                self.global.link[self.link] = false
                self.sprite:setSprite("button-up")
                self.sfx:play("switch36", false)
            end
        end
    )
    button.sprite:setSprite("button-up")
    button.sprite:register(button, 3)
    
    return button
end
return init