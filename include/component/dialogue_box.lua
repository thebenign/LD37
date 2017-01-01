local box = {
    env = require("env").getEnv()
}

box.__index = box

function box.give(entity)
    return setmetatable({
            x = 0,
            y = 0,
            w = 800,
            h = 200,
            v_align = 1,
            margin = 0,
            padding = 0,
            border = 0,
            border_color = {0,0,0,255},
            color = {50,50,50,255}
            }, box)
end

function box:setDimensions(w, h)
    self.w = w
    self.h = h
    self:_align()
end

function box:setMargin(x)
    self.margin = x
    self:_align()
end

function box:setPadding(x)
    assert(x < self.w/2, "Padding can not be more than half the width of the container")
    self.padding = x
end

function box:setAlignment(align)
    if type(align) == "string" then
        if align == "top" then
            self.v_align = -1
        elseif align == "center" then
            self.v_align = 0
        elseif align == "bottom" then
            self.v_align = 1
        else
            error('align: "'..align..'" is not a valid alignment. Use "top", "center", or "bottom"')
        end
    else
        error('align: alignment must be given as a string: "top", "center", or "bottom"')
    end
    self:_align()
end

function box:_align()
    self.x = (box.env.window_w-self.w)/2
    self.y = box.env.window_h/2 - self.h/2 + self.v_align*(box.env.window_h/2-self.margin)
end
