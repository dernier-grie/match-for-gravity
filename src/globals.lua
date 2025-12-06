love.graphics.setDefaultFilter("nearest", "nearest")
math.randomseed(os.time())

Texture = love.graphics.newImage("graphics/spritesheet.png")
QuadsAlphabet = {}
--[[
{
    ["a"] = quad,
    ["b"] = quad,
    ...
}
]]
Alphabet = "abcdefghijklmnopqrstuvwxyz!"
for i = 1, string.len(Alphabet) do
    local char = string.sub(Alphabet, i, i)
    QuadsAlphabet[char] = love.graphics.newQuad((i - 1) * 16, 0, 16, 16, Texture)
end

QuadsBlocks = {}
--[[
-- for each color
{
    quad, -- empty
    quad, -- full
},
...
]]
for i = 0, 3 do
    table.insert(QuadsBlocks, {
        love.graphics.newQuad((i * 2) * 16, 32, 16, 16, Texture),
        love.graphics.newQuad((i * 2 + 1) * 16, 32, 16, 16, Texture),
    })
end

QuadsNumbersSmall = {}
QuadsNumbers = {}
--[[
{
    [0] = quad,
    [1] = quad,
    ...
}
]]
local digits = "0123456789"
for i = 1, #digits do
    local digit = string.sub(digits, i, i)
    QuadsNumbersSmall[digit] = love.graphics.newQuad((i - 1) * 11, 20, 11, 12, Texture)
    QuadsNumbers[digit] = love.graphics.newQuad(112 + (i - 1) * 14, 20, 14, 14, Texture)
end

QuadsParticles = {}
--[[
{
    quad, -- small
    quad, -- regular
    quad, -- large
}
]]
QuadsParticles = {
    love.graphics.newQuad(273, 41, 1, 1, Texture),
    love.graphics.newQuad(274, 34, 4, 4, Texture),
    love.graphics.newQuad(277, 37, 6, 6, Texture),
}

QuadsTiles = {}
--[[
{
    [1] = quad, -- top left
    [2] = quad, -- top center
    [3] = quad, -- top right
    [4] = quad, -- center left
    ...
}
]]
for i = 1, 9 do
    QuadsTiles[i] = love.graphics.newQuad(128 + (i - 1) * 16, 32, 16, 16, Texture)
end

QuadsTarget = {}
--[[
-- for each target
{
    quad, -- regular
    quad -- inset
},
]]
for i = 0, 1 do
    table.insert(QuadsTarget, {
        love.graphics.newQuad(288 + i * 2 * 16, 32, 16, 16, Texture),
        love.graphics.newQuad(288 + (i * 2 + 1) * 16, 32, 16, 16, Texture),
    })
end

QuadsUI = {}
--[[
{
    ["controls"]
}
]]
QuadsUI["controls"] = love.graphics.newQuad(352, 32, 37, 15, Texture)
