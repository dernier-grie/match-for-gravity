Score = {}

local function getNumbers(value)
    local text = tostring(value)
    local numbers = {}
    for i = #text, 1, -1 do
        table.insert(numbers, { string.sub(text, i, i), 162 - 11 * (#text - i), 19 })
    end
    return numbers
end


function Score:new(value)
    local _value = value or 0

    local this = {
        ["value"] = _value,
        ["numbers"] = getNumbers(_value)
    }

    self.__index = self
    setmetatable(this, self)
    return this
end

function Score:add(value)
    self.value = self.value + (value or 1)
    self.numbers = getNumbers(self.value)
end

function Score:draw()
    for _, number in pairs(self.numbers) do
        love.graphics.draw(Texture, QuadsNumbersSmall[number[1]], number[2], number[3])
    end
end
