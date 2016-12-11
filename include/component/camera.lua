local camera = {
    x = 0,
    y = 0,
    rolloff = .6,
    follow_distance = 32,
    trig = require("trig"),
    env = require("env").getEnv()
}

camera.__index = camera

function camera:give()
    camera.entity = self
    return setmetatable({}, camera)
end

    
function camera.follow(entity)
    camera.entity = entity
end

function camera.update()
    if camera.entity then
        local dist = camera.trig.distance(camera.entity.position.x, camera.entity.position.y, camera.x+camera.env.window_w/2, camera.y+camera.env.window_h/2)
        local dir = camera.trig.theta(camera.entity.position.x, camera.entity.position.y, camera.x+camera.env.window_w/2, camera.y+camera.env.window_h/2)
        local nx, ny = camera.x, camera.y
        dist = (dist > .25) and dist or 0
        if dist > camera.follow_distance then
            nx, ny = camera.trig.translate(camera.x, camera.y, dir, (dist-camera.follow_distance)^camera.rolloff)
        end

        camera.x = nx
        camera.y = ny
    end

end

return camera