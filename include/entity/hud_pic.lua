local function init(parent)
    local hud_pic = setmetatable({}, parent)
    
    hud_pic:has("position", "sprite")
    
    hud_pic.position:setRelative(false)
    hud_pic.position:set(8, 260)
    
    hud_pic.sprite.visible = false
    hud_pic.sprite:register(hud_pic, 11)
    
    hud_pic.update = function(self)
        local item = self:getGlobal("window_has")
        if item then
            local x, y
            
            self.position:set(24-item.collider.w/2, 276-item.collider.h/2)
            self.sprite.img = item.sprite.img
            self.sprite.visible = true
        else
            self.sprite.visible = false
        end
    end
    
    
    return hud_pic
end
return init
