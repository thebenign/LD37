local function init(parent)
    local fire = setmetatable({}, parent)
    
    fire:has("position", "sprite", "collider")
    
    fire.sprite:setSpriteSheet("fire", 32)
    fire.sprite:setAnimationSpeed(4)
    fire.sprite:animationStart()
    fire.sprite:register(fire, 3)
    
    fire.collider:setType("rectangle", 32, 32)
    
    return fire
end
return init