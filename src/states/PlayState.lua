PlayState = BaseState:new()

function PlayState:enter()
    -- 1 column and row for the world outline
    local columns, rows = COLUMNS - 2, ROWS - 2

    self.columns = columns
    self.rows = rows
    self.column = 1
    self.row = self.rows
end

function PlayState:update(dt)
    if love.keyboard.waspressed("left") then
        self.column = self.column == 1 and self.columns or self.column - 1
    elseif love.keyboard.waspressed("right") then
        self.column = self.column == self.columns and 1 or self.column + 1
    end

    if love.keyboard.waspressed("up") then
        self.row = math.max(1, self.row - 1)
    elseif love.keyboard.waspressed("down") then
        self.row = math.min(self.rows, self.row + 1)
    end
end

function PlayState:draw()
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.draw(Texture, QuadsTarget[1][1], self.column * SPRITE_SIZE, self.row * SPRITE_SIZE)
end
