local function init(parent)
    local window = setmetatable({}, parent)
    
    window:setGlobal("window", true)
    window.stage = 0
    window.player_y = 0
    window.item = window:getGlobal("window_has")
    
    window:has("position", "sprite", "timer", "velocity", "collider", "sfx")
    
    window.sfx:new("boots")
    window.sfx:setVolume("boots", .4)
    
    window.collider:setType("rectangle", 32, 32)
    window.collider:collidesWith("ice", "warn")
    
    window.collider:setFunctionOn({"ice", "warn"}, function(self, other)
            if not self.item and self.stage == 1 then
                self:setGlobal("window_has", other)
                other.position:set(0,0)
                other.sprite.visible = false
                self.item = other
            end
        end
    )
    
    
    window.sprite:setSprite("window")
    window.sprite:register(window, 3)
    
    window.velocity:set(math.rad(90), 24)
    
    window.update = function(self)
        if self.position.y > self.player_y then
            self.sfx:play("boots", false)
            self.velocity:set(0,0)
            self.position.y = self.player_y
            self.stage = 1
            window.timer:set(30, false)
            if self.item then
                self.item.sprite.visible = true
                local x, y = self.position:get()
                self.item.position:set(x+16-self.item.collider.w/2, y+16-self.item.collider.h/2)
                self:setGlobal("window_has", false)
            end 
        end
    end
    
    
    window.timer.call = function(self)
        if self.stage == 1 then
            self:setGlobal("window", false)
            self:destroy()
        end
    end
    
    return window
end
return init
