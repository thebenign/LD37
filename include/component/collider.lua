local collider = {
    list = {},
    cell = {},
    enum = 0,
    size = 448,
    resolvers = {
        r2r = require("r2r"),
        c2r = require("c2r"),
        none = function() end
    },
    env = require("env"),
    world = require("world").getSize(),
    cam = require("camera"),
    map = require("map")
}

collider.__index = collider
collider.w = math.ceil(collider.world[1]/collider.size)

function collider.reset()
    collider.list = {}
    collider.cell = {}
    collider.enum = 0
end

function collider:give()
    collider.enum = collider.enum + 1
    collider.list[collider.enum] = self
    return setmetatable({
            id = collider.enum, 
            cells = {l = {}, n = {}},
            hash = {},
            l = {},
            n = 0,
            dynamic = true,
            collides_with = {},
            stopped_by = {},
            collider_call = {},
            collider_call_off = {},
            last = {},
            offset_x = 0,
            offset_y = 0,
            active = true,
            }, collider)
end

function collider:collidesWith(...)
    local arg = {...}
    self.has_resolvers = true
    for i = 1, #arg do
        self.collides_with[arg[i]] = true
    end
end

function collider:stoppedBy(...)
    local arg = {...}
    for i = 1, #arg do
        self.stopped_by[arg[i]] = true
    end
end

function collider:setAction(with, resolver)
    self.collides_with[with] = collider.resolvers[resolver]
end

function collider:setFunctionOn(with, func)
    local arg
    if type(with) == "table" then
        arg = with
    else
        arg = {with}
    end
    for i = 1, #arg do
        self.collider_call[arg[i]] = func
    end
end

function collider:setFunctionOff(with, func)
    local arg
    if type(with) == "table" then
        arg = with
    else
        arg = {with}
    end
    for i = 1, #arg do
        self.collider_call_off[arg[i]] = func
    end
end

function collider:setType(t, ...)
    local arg = {...}
    if t == "rectangle" then
        self.w = arg[1]
        self.h = arg[2]
        self.addMethod = collider.addRectangle
    elseif t == "circle" then
        self.r = arg[1]
        self.w = arg[1]*2
        self.h = arg[1]*2
        self.addMethod = collider.addCircle
    elseif t == "point" then
        self.w = 0
        self.h = 0
    elseif t == "map" then
        collider.addMethod = collider.addRectangle
        collider.addMap()
        self.dynamic = false
    else
        error(t.." is not a valid collider type")
    end
    self.t = t
end

function collider:setOffset(x,y)
    self.offset_x = x
    self.offset_y = y
end

function collider:remove()
    local gcell, ecell
    for i = 1, self.collider.n do
        ecell = self.collider.cells
        gcell = collider.cell[ecell.l[i]]
        
        gcell.l[ecell.n[i]] = gcell.l[gcell.n]
        gcell.n = gcell.n - 1
        
        --collider.cell[self.collider.cells.l[i]].l[self.collider.cells.n[i]] = 
        --collider.cell[self.collider.cells.l[i]].l[collider.cell[self.collider.cells.l[i]].n]
        --collider.cell[self.collider.cells.l[i]].n = collider.cell[self.collider.cells.l[i]].n - 1
    end
end

function collider:add()
    self.collider.addMethod(self)
    local collider_cell, e_cell
    for i = 1, self.collider.n do
        e_cell = self.collider.cells.l[i]
        collider.cell[e_cell] = collider.cell[e_cell] or {l={},n=0}
        collider_cell = collider.cell[e_cell]
        collider_cell.n = collider_cell.n + 1
        collider_cell.l[collider_cell.n] = self
        self.collider.cells.n[i] = collider_cell.n
    end
end

function collider.addCircle(self)
    return collider.updateCells(self, self.position.x-self.collider.r, self.position.y-self.collider.r, self.collider.w, self.collider.h)
end

function collider:addRectangle()
    return collider.updateCells(self, self.position.x+self.collider.offset_x, self.position.y+self.collider.offset_y, self.collider.w, self.collider.h)
end

function collider.addMap()
    local map_obj, map_data
    map_data = collider.map.map_data.map
    for _, layer in ipairs(map_data.layers) do
        if layer.type ~= "tilelayer" then break end
        for i = 1, layer.width*layer.height do
            if layer.data[i] > 0 and layer.properties["collide"] then
                map_obj = collider.map.entityFromData(i-1)
                map_obj.collider = collider.give(map_obj)
                map_obj.collider.w = map_data.tilewidth
                map_obj.collider.h = map_data.tileheight
                map_obj.collider.dynamic = false
                map_obj.id = "map"
                collider.add(map_obj)
            end
        end
    end
end

function collider.getCell(x, y)
    local tx, ty
    tx = x/collider.size
    ty = y/collider.size
    return (ty-ty%1)*collider.w+(tx-tx%1)+1
end


function collider.updateCells(self, x, y, w, h)
    local c, n = 0, 0
    local tx, ty
    for i = 1, self.collider.n do
        self.collider.hash[self.collider.l[i]] = nil
        self.collider.cells.l[i] = nil
    end
    for i = 1, 4 do
        tx = (x + (i%2==0 and 0 or w-1)) / collider.size
        ty = (y + (i>2 and 0 or h-1)) / collider.size
        c = (ty-ty%1)*collider.w+(tx-tx%1)+1
        
        if not self.collider.hash[c] then
            n = n + 1
            self.collider.l[n] = c
            self.collider.hash[c] = true
            self.collider.cells.l[n] = c
        end
    end
    self.collider.n = n
end

function collider:update()
    if self.collider.dynamic then
        collider.remove(self)
        collider.add(self)
        --print(self.id, self.collider.cells.l[1], self.collider.cells.n[1])
    end
    local entity, hit, neighbors
    --for i = 1, self.collider.n do
    for i = 1, collider.enum do
        --for j = 1, collider.cell[self.collider.cells.l[i]].n do
        --for j = 1, collider.cell[1].n do
            --entity = collider.cell[1].l[j]
            entity = collider.list[i]
            if self ~= entity and self.collider.collides_with[entity.id] then
                hit = collider.resolvers.r2r(self, entity)
                if hit and entity.collider.active then
                    if self.collider.stopped_by[entity.id] then
                        if hit.dx then
                            self.position.x = self.position.x - hit.dx
                        end
                        if hit.dy then
                            self.position.y = self.position.y - hit.dy
                        end
                    end
                    if self.collider.collider_call[entity.id] then
                        local is_repeat = false
                        if self.collider.last[entity] then is_repeat = true end
                        self.collider.collider_call[entity.id](self, entity, hit, is_repeat)
                    end
                    self.collider.last[entity] = true
                else
                    if self.collider.last[entity] and self.collider.collider_call_off[entity.id] then
                        self.collider.collider_call_off[entity.id](self, entity)
                        self.collider.last[entity] = nil
                    end
                end
            end
        --end
        
    end
    ENUM = collider.enum
end

function collider:getNeighbors()
    local neighbors = {}
    local count = 0
    for i = 1, self.n do
        for j, item in ipairs(collider.cell[self.cells.l[i]]) do
            count = count + 1
            neighbors[count] = item
        end
    end
    return neighbors
end

function collider:destroy()
    local id = self.collider.id
    collider.remove(self)
    collider.list[collider.enum].collider.id = id
    collider.list[id] = collider.list[collider.enum]
    collider.enum = collider.enum - 1
end

function collider.draw()
    love.graphics.setColor(0,0,0,255)
    local cam_x = math.floor(collider.cam.x)
    local cam_y = math.floor(collider.cam.y)
    local floor = math.floor
    if collider.env.debug then
        for y = 0, collider.w-1 do
            for x = 0, collider.w-1 do
                love.graphics.print(collider.cell[y*collider.w+x+1] and collider.cell[y*collider.w+x+1].n or 0,x*collider.size-cam_x, y*collider.size-cam_y)
                love.graphics.rectangle("line", x*collider.size-cam_x, y*collider.size-cam_y, collider.size, collider.size)
            end
        end
    end
end

return collider