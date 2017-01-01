local world = {
    camera = require("camera"),
    music = require("music"),
    music_vol = 0,
    music_max = .4,
    timer = require("timer").give({}),
    w = 448,
    h = 448,
    state = "",
    states = require("load_states"),
}

world.timer:stop()

function world.setState(state)
    world.state = state
    for i, entity in world.states[state] do
        world.entity(entity)
    end
end

function world.setSize(w, h)
    world.w = w
    world.h = h
end

function world.getSize()
    return {world.w, world.h}
end

function world.camFollow(entity)
    world.camera.follow(entity)
end

function world.update()
    world.timer.update(world)
end

function world.startMusic(source)
    world.timer:set(1, true)
    world.timer:start()
    world.timer.call = function(self)
        world.music_vol = world.music_vol + .001
            world.music[source]:setVolume(world.music_vol)
        if world.music_vol > world.music_max then
            world.timer:stop()
        end
    end
    world.music[source]:setVolume(0)
    world.music[source]:setLooping(true)
    world.music[source]:play()
end

return world