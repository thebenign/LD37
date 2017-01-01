local shader = {
    list = {},
    n = 0,
    shader_obj = love.graphics.newShader(
}

shader.__index = shader

function shader:give()
    shader.n = shader.n + 1
    shader.list[shader.n] = self
    local obj = setmetatable({
        id = shader.n
        }, shader
    )
    return obj
end

function shader:update()
end

function shader._send(ext, val)
    shader.shader_obj:send("