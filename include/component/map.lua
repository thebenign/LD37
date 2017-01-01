local map = {
    map_data = {},
    map_batch = {},
    objects = {},
    load_map = require("load_map")
    }
map.__index = map

function map:give()
    self.id = "map"
    return setmetatable({}, map)
end

map.destroy = function(self)
    map.map_data = {}
    map.map_batch = {}
    map.objects = {}
end

function map.entityFromData(i)
    local data = map.map_data.map
    return {
        position = {
            x = (i%data.width)*data.tilewidth,
            y = (math.floor(i/data.width))*data.tileheight
            }
        }
end


function map:new(name)
    map.map_data = map.load_map(name)
    map.map_batch = map.makeBatch(map.map_data)
    map.objects = map.getObjects(map.map_data)
end

function map.getObjects(map_table)
    local obj_list = {}
    for _, layer in ipairs(map_table.map.layers) do
        if layer.type == "objectgroup" then
            for i, object in ipairs(layer.objects) do
                obj_list[i] = {
                    name = object.name,
                    x = object.x,
                    y = object.y-object.height,
                    properties = object.properties
                }
            end
        end
    end
    return obj_list
end

function map.makeBatch(map_table)
    local data = map_table.map
    local tilesets = map_table.tilesets
    
    local batch = {}--love.graphics.newSpriteBatch(tilesets[1], data.height*data.width, "static")
    local quad = {}
    local qh = data.tilesets[1].imagewidth/data.tilesets[1].tilewidth
    local qv = data.tilesets[1].imageheight/data.tilesets[1].tileheight
    for i = 0, qh*qv-1 do
        quad[i+1] = love.graphics.newQuad(
            i%qh * data.tilesets[1].tilewidth,
            math.floor(i/qh)*data.tilesets[1].tileheight,
            data.tilesets[1].tilewidth,
            data.tilesets[1].tileheight,
            data.tilesets[1].imagewidth,
            data.tilesets[1].imageheight
        )
    end
    local z = {}
    local count = 0
    for i, layer in ipairs(data.layers) do
        if layer.type == "tilelayer" then
            count = count + 1
        else
            break
        end
        batch[i] = love.graphics.newSpriteBatch(tilesets[1], layer.height*layer.width, "static")
        z[i] = layer.properties.z
        for j = 1, #layer.data do
            if layer.data[j] > 0 then
                batch[i]:add(
                    quad[layer.data[j]],
                    (j-1)%layer.width*data.tilesets[1].tilewidth, 
                    math.floor((j-1)/layer.height)*data.tilesets[1].tileheight
                )
            end
        end
    end
    return {batch = batch, z = z}
end

function map.update()
end

return map