local function init(parent)
    local player = setmetatable({}, parent)
    
    local speed = 1.5
    player.w = {}
    
    player:has("position", "sprite", "control", "collider", "camera", "velocity")
    
    player.position:set(140, 80)
    player.sprite:setOrigin(16,24)
    player.collider:setType("circle", 8)
    player.collider:collidesWith("map")
    
    player.sprite:setSpriteSheet("player", 32)
    player.sprite:setAnimationSpeed(8)
    player.sprite:register(player, 2)
    
    player.update = function(self)
        local w = self.w
        if w[1] or w[2] or w[3] or w[4] then
            self.sprite:animationStart()
        else
            self.walking = false
            self.sprite:animationStop()
        end
        self.w = {}
    end
    
    
    player.control:on("up", function(self)
            self.position.y = self.position.y - speed
            self.w[1] = true
        end
    )
    player.control:on("down", function(self)
            self.position.y = self.position.y + speed
            self.w[2] = true
        end
    )
    player.control:on("left", function(self)
            self.position.x = self.position.x - speed
            self.w[3] = true
        end
    )
    player.control:on("right", function(self)
            self.position.x = self.position.x + speed
            self.w[4] = true
        end
    )
    
    player.control:onRelease({"up","down","left","right"}, function(self)
            --[[if not self.w[1] or not self.w[2] or not self.w[3] or not self.w[4] then
                self.walking = false
            end]]
            
        end
    )
    player.control:onPress({"up","down","left","right"}, function(self)
            if not self.walking then
                self.sprite:setFrame(1)
                self.walking = true
            end
        end
    )
    
    return player
end

return init