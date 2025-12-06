Block = {}

function Block:new(column, row, type, color)
    local _column = column or 1
    local _row = row or 1
    local _type = type or 1
    local _color = color or math.random(#BLOCKS)
    local this = {
        ["column"] = _column,
        ["row"] = _row,
        ["type"] = _type,
        ["color"] = _color
    }

    self.__index = self
    setmetatable(this, self)
    return this
end

function Block:fill()
    self.type = 2
end

function Block:draw()
    love.graphics.draw(
        Texture,
        QuadsBlocks[self.color][self.type],
        self.column * SPRITE_SIZE,
        self.row * SPRITE_SIZE
    )
end
