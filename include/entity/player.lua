local function init(parent)
    local player = setmetatable({}, parent)
    
    player.speed = 1
    player.w = {}
    player.dir = 3
    
    player:has("position", "sprite", "control", "collider", "camera", "velocity")
    
    player.target = player.new("target")
    
    player.position:set(140, 90)
    
    --player.sprite:setOrigin(0,16)
    player.sprite:setSpriteSheet("walk-down", 32)
    player.sprite:setAnimationSpeed(8)
    player.sprite:register(player, 5)
    
    player.collider:setType("rectangle", 16, 16)
    player.collider:setOffset(0, 8)
    player.collider:collidesWith("map", "ice", "trap", "button", "fire")
    player.collider:stoppedBy("map", "trap", "fire")
    
    player.update = function(self)
        local w = self.w
        if w[1] or w[2] or w[3] or w[4] then
            self.sprite:animationStart()
        else
            self.walking = false
            self.sprite:animationStop()
        end
        
        if self:getGlobal("link") == 2 then
            self.collider.stopped_by["trap"] = false
        else
            self.collider.stopped_by["trap"] = true
        end
        local x = (math.floor((self.position.x+16)/32)*32) + (self.dir%2 == 0 and (self.dir == 2 and 32 or -32) or 0)
        local y = (math.floor((self.position.y+24)/32)*32) + (self.dir%2 ~= 0 and (self.dir == 3 and 32 or -32) or 0)
        self.target.position.x = x
        self.target.position.y = y
        self.w = {}
    end

    player.control:on("space", function(self)
            if not self:getGlobal("window") then
                local window = self.new("window")
                window.position.x = (math.floor((self.position.x+16)/32)*32) + (self.dir%2 == 0 and (self.dir == 2 and 32 or -32) or 0)
                window.player_y = (math.floor((self.position.y+24)/32)*32) + (self.dir%2 ~= 0 and (self.dir == 3 and 32 or -32) or 0)
                window.position.y = self.position.y - 180
            end
            
        end
    )
    
    
    player.control:on("up", function(self)
            self.position.y = self.position.y - player.speed
            self.w[1] = true
            self.dir = 1
            self.sprite:setSprite("walk-up")
        end
    )
    player.control:on("down", function(self)
            self.position.y = self.position.y + player.speed
            self.w[2] = true
            self.dir = 3
            self.sprite:setSprite("walk-down")
        end
    )
    player.control:on("left", function(self)
            self.position.x = self.position.x - player.speed
            self.w[3] = true
            self.dir = 4
            self.sprite:setSprite("walk-left")
        end
    )
    player.control:on("right", function(self)
            self.position.x = self.position.x + player.speed
            self.w[4] = true
            self.dir = 2
            self.sprite:setSprite("walk-right")
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