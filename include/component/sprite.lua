local sprite = {
    zenum = 0,
    zlist = {},
    image_table = require("image"),
    batch_table = require("map"),
    camera = require("camera"),
    t = require("timer"),
    }
sprite.__index = sprite

function sprite.give(entity)
    local s = {
        img = sprite.image_table.null,
        color = {255,255,255,255},
        scale = 1, 
        rot = 0, 
        origin_x = 0, 
        origin_y = 0,
        visible = true
        }
    setmetatable(s, sprite)
    return s
end

function sprite:setMap(batch)
    for k, v in pairs(sprite.batch_table.map_batch) do
        print(k, v)
    end
    
    for i, batch in ipairs(sprite.batch_table.map_batch.batch) do
        local z = sprite.batch_table.map_batch.z[i]
        local s = {
            position = {
                x = 0,
                y = 0,
                relative = true
            },
            sprite = sprite.give()
        }
        s.sprite.img = batch
        s.sprite:register(s, z)
    end
    self.visible = false
end

function sprite:setSprite(img)
    self.img = sprite.image_table[img]
end

function sprite:setSpriteSheet(img, frame_width)
    self.img = sprite.image_table[img]
    local img_w, img_h = self.img:getDimensions()
    self.animated = true
    self.frame = 0
    self.frames = math.floor(img_w/frame_width)
    self.frame_width = frame_width
    self.frame_height = img_h
    self.quad = love.graphics.newQuad(0,0,frame_width, img_h, img_w, img_h)
    self.timer = sprite.t.give(self)
    self.timer.call = function(self)
        self.frame = (self.frame + 1) % self.frames
        self.quad:setViewport(self.frame*self.frame_width, 0, self.frame_width, self.frame_height)
    end
    
    self.timer:set(2, true)
    self.timer:stop()
end

function sprite:setAnimationSpeed(s)
    self.timer:set(s, true)
end

function sprite:setFrame(frame)
    self.frame = frame
end

function sprite:animationStart()
    self.timer:start()
    self.quad:setViewport(self.frame*self.frame_width, 0, self.frame_width, self.frame_height)
end

function sprite:animationStop()
    self.timer:stop()
    self.frame = 0
    self.quad:setViewport(self.frame*self.frame_width, 0, self.frame_width, self.frame_height)
end

function sprite:setOrigin(x, y)
    self.origin_x, self.origin_y = x, y
end

function sprite.remove(id)
    for i = id, sprite.zenum-1 do
        sprite.zlist[i] = sprite.zlist[i+1]
        sprite.zlist[i].sprite.id = sprite.zlist[i].sprite.id - 1
    end
    sprite.zenum = sprite.zenum - 1
end

function sprite:register(ent, z)
    ent.sprite.z = z
    self:addZ(ent, z)
end

function sprite:addZ(entity, z)
    entity.sprite.z = z
    local new_list = {}
    local found = false
    
    for i = 1, sprite.zenum do
        if z < sprite.zlist[i].sprite.z or found then
            new_list[i] = sprite.zlist[i - (found and 1 or 0)]
            new_list[i].sprite.id = i
        else
            new_list[i] = entity
            self.id = i
            found = true
        end
    end
    sprite.zenum = sprite.zenum + 1
    if not found then
        new_list[sprite.zenum] = entity
        entity.sprite.id = sprite.zenum
    else
        new_list[sprite.zenum] = sprite.zlist[sprite.zenum - 1]
        new_list[sprite.zenum].sprite.id = sprite.zenum
    end
    
    sprite.zlist = new_list
--    print("Adding to zlist\nenum: "..sprite.zenum)
--    for i, v in ipairs(sprite.zlist) do
--        print("index: "..i, tostring(v), "id: "..v.sprite.id)
--    end
--    print("~")
end

function sprite:update()
    if self.sprite.timer then
        self.sprite.timer.update(self.sprite)
    end
end

function sprite:destroy()
    sprite.remove(self.sprite.id)
end

function sprite.draw()
    local entity
    for i = sprite.zenum, 1, -1 do
        entity = sprite.zlist[i]
        if entity.sprite.visible then
            love.graphics.setColor(255,255,255,255)
            if entity.sprite.quad then
                love.graphics.draw(
                    entity.sprite.img,
                    entity.sprite.quad,
                    math.floor(entity.position.x-(entity.position.relative and sprite.camera.x or 0)),
                    math.floor(entity.position.y-(entity.position.relative and sprite.camera.y or 0)), 
                    entity.sprite.rot, 
                    entity.sprite.scale, 
                    entity.sprite.scale, 
                    entity.sprite.origin_x, 
                    entity.sprite.origin_y
                )
            else
                love.graphics.draw(
                    entity.sprite.img,
                    math.floor(entity.position.x-(entity.position.relative and sprite.camera.x or 0)),
                    math.floor(entity.position.y-(entity.position.relative and sprite.camera.y or 0)), 
                    entity.sprite.rot, 
                    entity.sprite.scale, 
                    entity.sprite.scale, 
                    entity.sprite.origin_x, 
                    entity.sprite.origin_y
                )
            end
        end
    end
end

return sprite