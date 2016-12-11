function intersectAABB(self,box)
  local dx = box.x - self.x
  local px = (box.xm + self.xm) - math.abs(dx)
  if px <= 0 then return end
  
  local dy = box.y - self.y
  local py = (box.ym + self.ym) - math.abs(dy)
  if py <= 0 then return end
  
  local hit = {}
  if px < py then
    local sx = sign(dx)
    hit.dx = px*sx
    hit.normal_x = sx

    hit.x = box.x + (box.xm * sx)
    hit.y = self.y
  else
    local sy = sign(dy)
    hit.dy = py*sy
    hit.normal_y = sy

    hit.x = self.x
    hit.y = box.y + (box.ym * sy)
  end
  return hit
end