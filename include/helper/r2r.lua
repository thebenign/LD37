local function intersectAABB(self,other)
    local sign = require("trig").sign
    
    local dx = (other.position.x+other.collider.offset_x) - (self.position.x+self.collider.offset_x)
    local px = (other.collider.w/2 + self.collider.w/2) - math.abs(dx)
    if px <= 0 then return end
    local dy = (other.position.y+other.collider.offset_y) - (self.position.y+self.collider.offset_y)
    local py = (other.collider.h/2 + self.collider.h/2) - math.abs(dy)
    if py <= 0 then return end

    local hit = {}
    if px < py then
        local sx = sign(dx)
        hit.dx = px*sx
        hit.normal_x = sx

        hit.x = other.position.x+other.collider.offset_x + (other.collider.w * sx)
        hit.y = self.position.y
    else
        local sy = sign(dy)
        hit.dy = py*sy
        hit.normal_y = sy

        hit.x = self.position.x
        hit.y = other.position.y+other.collider.offset_y + (other.collider.h * sy)
    end
    return hit
end

return intersectAABB