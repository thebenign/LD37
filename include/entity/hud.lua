local function init(parent)
    local hud = setmetatable({}, parent)
    hud:has("position", "sprite")
    
    hud.item = false
    hud.pic = hud.new("hud_pic")
    
    hud.position:set(8,260)
    hud.position:setRelative(false)
    
    hud.sprite:setSprite("window")
    hud.sprite:register(hud, 10)
    
    hud.update = function(self)
        if self:getGlobal("window_has") then
            self.item = self:getGlobal("window_has")
        end
    end
    
    
    return hud
end
return init