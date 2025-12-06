Screen = {}

function Screen:new()
    local this = {}

    self.__index = self
    setmetatable(this, self)
    return this
end

function Screen:start()
    love.graphics.scale(SCREEN_SCALE)
end

function Screen:finish()
end
