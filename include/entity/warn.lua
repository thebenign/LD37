local function init(parent)
    local warn = setmetatable({}, parent)
    
    warn:has("position", "sprite", "collider")
    warn.sprite:setSprite("warn-tile")
    --ice.sprite:setOrigin(16,16)
    warn.sprite:register(warn, 3)
    warn.collider:setType("rectangle", 32, 32)
    warn.collider:collidesWith("map", "ice")
    warn.collider:stoppedBy("map", "ice")
    
    return warn
end
return init