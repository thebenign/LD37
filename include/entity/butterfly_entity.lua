local function init(parent)
    local butterfly_entity = setmetatable({}, parent)
    butterfly_entity:has("position", "sprite","velocity","collider", "timer")
    
    butterfly_entity.collider:setType("rectangle", 8,8)
    butterfly_entity.collider:collidesWith("map")
    butterfly_entity.collider:stoppedBy("map")
    
    butterfly_entity.velocity:set(math.pi/3, .4)
    
    butterfly_entity.collider:setFunctionOn("map", function(self, other, hit)
            if hit.dx then
                local norm = math.rad(hit.normal_x * 180)
                self.velocity.dir = 2 * norm - math.pi - self.velocity.dir
            end
            if hit.dy then
                local norm = math.rad(hit.normal_y * 90)
                self.velocity.dir = 2 * norm - math.pi - self.velocity.dir
            end
        end
    )
                --self.velocity.dir = self.velocity.dir + (hit.normal_x*
    
    butterfly_entity.sprite:setSpriteSheet("butterfly",32)
    butterfly_entity.sprite:setAnimationSpeed(4)
    butterfly_entity.sprite:animationStart()
    butterfly_entity.sprite:register(butterfly_entity, 9)
    butterfly_entity.sprite.blend = "add"
    
    butterfly_entity.timer:set(1, true)
    
    butterfly_entity.hue = 0
    butterfly_entity.angle_delta = 0
    
    butterfly_entity.update = function(self)
        self.angle_delta = (self.angle_delta + .01) % 1
        self.velocity.dir = self.velocity.dir + (self.angle_delta*2-1)*math.rad(3)
    end
    
    butterfly_entity.timer.call = function(self)
        self.hue = (self.hue + 5) % 255
        local color = self.sprite.hsl(self.hue, 255,120, 255)
        self.sprite.color = color
    end
    
    
    return butterfly_entity
end
return init
