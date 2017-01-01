local function init(parent)
    local orb = setmetatable({}, parent)
    
    orb:has("position", "velocity", "collider", "shader")
    
    orb.position:set(math.random(300)+32,math.random(300)+32)
    
    orb.velocity:set(math.random()*math.pi*2, .2)
    
    orb.collider:setType("rectangle", 10, 10)
    
    orb.collider:collidesWith("map")
    
    return orb
end
return init
