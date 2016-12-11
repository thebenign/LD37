package.path = package.path .. ";./include/core/?.lua;./include/component/?.lua;./include/entity/?.lua;./include/helper/?.lua;./include/state/?.lua;"

local env = require "env"
local world = require "world"
local entity = require "ecs"


function love.load()
    entity("map_entity")
    entity("player")
end

function love.update(dt)
    env.dt = env.dt + dt
    if env.dt > env.t then
        entity.update()
        env.dt = env.dt - env.t
    end
end

function love.draw()
    entity.draw()
end