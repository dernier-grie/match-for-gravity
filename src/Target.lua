Target = {}

function Target:new(column, row, type)
    local this = {
        ["column"] = column,
        ["row"] = row,
        ["type"] = type or 1,
        ["index"] = 1,
        ["t"] = 0,
        ["interval"] = 0.2,
    }

    self.__index = self
    setmetatable(this, self)
    return this
end

function Target:update(dt)
    self.t = self.t + dt
    if self.t > self.interval then
        self.t = self.t % self.interval
        self.index = self.index == 1 and 2 or 1
    end
end

function Target:draw()
    love.graphics.draw(
        Texture,
        QuadsTarget[self.type][self.index],
        self.column * SPRITE_SIZE,
        self.row * SPRITE_SIZE
    )
end
