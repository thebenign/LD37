local timer = {
    list = {},
    n = 0
    }
timer.__index = timer

function timer.give(entity)
    timer.n = timer.n + 1
    local t = setmetatable({
            id = timer.n,
            t = 60,
            dt = 0,
            call = function() end,
            loop = false,
            run = true
        }, timer
    )
    timer.list[timer.n] = t
    return t
    
end

function timer:destroy()
    timer.list[self.id] = timer.list[timer.n]
    timer.n = timer.n - 1
end

function timer:set(t, loop)
    self.t = t
    self.loop = loop
end

function timer:stop()
    self.run = false
    self.dt = 0
end

function timer:start()
    self.run = true
end

function timer:update()
    if self.timer.run then
        self.timer.dt = self.timer.dt + 1
    end
    if self.timer.dt > self.timer.t then
        self.timer.call(self)
        self.timer.dt = 0
        if not self.timer.loop then
            self.timer.run = false
        end
    end
    
end

return timer