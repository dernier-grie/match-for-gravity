PlayState = BaseState:new()

function PlayState:enter()
    -- 1 column and row for the world outline
    local columns, rows = COLUMNS - 2, ROWS - 2

    self.columns = columns
    self.rows = rows
    self.column = 1
    self.row = self.rows

    self.currentTarget = Target:new(self.column, self.row)
    self.previousTarget = nil

    self.state = "select"
end

function PlayState:update(dt)
    if love.keyboard.waspressed("left") then
        self.column = self.column == 1 and self.columns or self.column - 1
        self.currentTarget["column"] = self.column
    elseif love.keyboard.waspressed("right") then
        self.column = self.column == self.columns and 1 or self.column + 1
        self.currentTarget["column"] = self.column
    end

    if love.keyboard.waspressed("up") then
        self.row = math.max(1, self.row - 1)
        self.currentTarget["row"] = self.row
    elseif love.keyboard.waspressed("down") then
        self.row = math.min(self.rows, self.row + 1)
        self.currentTarget["row"] = self.row
    end

    if love.keyboard.waspressed("return") then
        if self.state == "select" then
            self.currentTarget = Target:new(self.currentTarget["column"], self.currentTarget["row"], 1)
            self.previousTarget = Target:new(self.currentTarget["column"], self.currentTarget["row"], 2)
            self.state = "swap"
        elseif self.state == "swap" then
            self.previousTarget = nil
            self.state = "select"
        end
    end

    self.currentTarget:update(dt)
    if self.previousTarget then
        self.previousTarget:update(dt)
    end
end

function PlayState:draw()
    love.graphics.setColor(1, 1, 1, 1)

    self.currentTarget:draw()
    if self.previousTarget then
        self.previousTarget:draw()
    end
end
