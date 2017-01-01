local function init(parent)
    local butterfly = setmetatable({}, parent)
    
    butterfly.state = 0
    
    butterfly:has("sprite", "position", "timer", "velocity")
    
    local wall = math.random(4)

    local x = wall%2~=0 and math.random(448) or (math.random(2)-1)*448
    local y = wall%2==0 and math.random(448) or (math.random(2)-1)*448

    butterfly.position:set(x, y)
    butterfly.velocity:set(math.random()*math.pi*2, .5)
    
    butterfly.sprite:setSpriteSheet("butterfly", 32)
    butterfly.sprite:register(butterfly, 0)
    butterfly.sprite.color = {255,255,255,0}
    butterfly.sprite.rot = butterfly.velocity.dir+math.rad(90)
    butterfly.sprite:setAnimationSpeed(4)
    butterfly.sprite:animationStart()
    
    butterfly.timer:set(1, true)
    
    butterfly.timer.call = function(self)
        if self.state == 0 then
            self.sprite.color[4] = self.sprite.color[4] + 10
            if self.sprite.color[4] >= 255 then
                self.sprite.color[4] = 255
                self.state = 1
                self.timer:set(math.random(200), true)
            end
        elseif self.state == 1 then
            self.state = 2
            self.timer:set(1, true)
        elseif self.state == 2 then
            self.sprite.color[4] = self.sprite.color[4] - 10
            if self.sprite.color[4] <= 0 then
                self:destroy()
            end
        end
    end
    
    return butterfly
end
return init