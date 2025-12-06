World = {}

local smallParticlesX, smallParticlesY = math.floor(WIDTH / 14),
    math.floor(HEIGHT / 14)
local normalParticles = math.floor(math.min(smallParticlesX, smallParticlesY) / 2)

local spriteBatchTiles = love.graphics.newSpriteBatch(Texture, COLUMNS * ROWS)
local spriteBatchParticles = love.graphics.newSpriteBatch(Texture,
    smallParticlesX * smallParticlesY + normalParticles)

function World:new()
    local this = {}

    self.__index = self
    setmetatable(this, self)
    return this
end

function World:draw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(spriteBatchTiles)
    love.graphics.draw(spriteBatchParticles)
end

local tileX, tileY = -1, -1
local tileQuadIndex = 5

local tilesGrid = {}
for c = 0, COLUMNS - 1 do
    local column = {}
    tileX = c * SPRITE_SIZE
    for r = 0, ROWS - 1 do
        tileY = r * SPRITE_SIZE
        table.insert(column, { tileQuadIndex, tileX, tileY })
    end
    table.insert(tilesGrid, column)
end

for c = 1, COLUMNS do
    tilesGrid[c][1][1] = 2
    tilesGrid[c][ROWS][1] = 8
end

for r = 1, ROWS do
    tilesGrid[1][r][1] = 4
    tilesGrid[COLUMNS][r][1] = 6
end

tilesGrid[1][1][1] = 1
tilesGrid[COLUMNS][1][1] = 3
tilesGrid[1][ROWS][1] = 7
tilesGrid[COLUMNS][ROWS][1] = 9

for _, column in pairs(tilesGrid) do
    for _, cell in pairs(column) do
        spriteBatchTiles:add(QuadsTiles[cell[1]], cell[2], cell[3])
    end
end

for _ = 1, smallParticlesX do
    for _ = 1, smallParticlesY do
        spriteBatchParticles:add(
            QuadsParticles[1],
            math.floor(math.random() * WIDTH),
            math.floor(math.random() * HEIGHT)
        )
    end
end

local minX, minY = SPRITE_SIZE, SPRITE_SIZE
local maxX, maxY = WIDTH - SPRITE_SIZE, HEIGHT - SPRITE_SIZE

for _ = 1, normalParticles do
    spriteBatchParticles:add(
        QuadsParticles[2],
        math.floor(math.random() * (maxX - minX) + minX),
        math.floor(math.random() * (maxY - minY) + minY)
    )
end
