local function init(parent)
    local guy = setmetatable({}, parent)
    
    guy:has("position","sprite", "collider")
    
    guy.sprite:setSprite("guy")
    guy.sprite:register(guy, 3)
    
    guy.collider:setType("rectangle", 32,32)
    guy.collider:collidesWith("player")
    
    guy.collider:setFunctionOn("player", function(self)
            if not self:getGlobal("swap") then
                local room = self:getGlobal("room") or 1
                self:setGlobal("swap", true)
            end
            
        end
    )
    
    return guy
end
return init