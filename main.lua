package.path = package.path .. ";./include/core/?.lua;./include/component/?.lua;./include/entity/?.lua;./include/helper/?.lua;./include/state/?.lua;"

local env = require "env"
local world = require "world"
local entity = require "ecs"

io.stdout:setvbuf("no")

function love.load()
    
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    entity("map_entity")
    world.startMusic(2)
end

function love.update(dt)
    env.dt = env.dt + dt
    if env.dt > env.t then
        entity.update()
        world.update()
        env.dt = env.dt - env.t
    end
end

function love.draw()
    love.graphics.scale(2,2)
    entity.draw()
end