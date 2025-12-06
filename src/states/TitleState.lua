TitleState = BaseState:new()

function TitleState:enter()
    local text = "Match for gravity"
    local charX, charY = 0, 0
    local lineHeight = 4
    local words = {}

    for line in string.gmatch(string.lower(text), "%S+") do
        charX = 0
        local word = {}
        local width = string.len(line) * CHAR_SIZE

        local startX = WIDTH / 2 - width / 2
        for i = 1, string.len(line) do
            local char = string.sub(line, i, i)
            if string.find(Alphabet, char) then
                table.insert(word, { char, charX + startX, charY })
                charX = charX + CHAR_SIZE
            end
        end

        charY = charY + CHAR_SIZE + lineHeight
        table.insert(words, word)
    end

    for _, word in pairs(words) do
        for _, character in pairs(word) do
            character[3] = HEIGHT / 2 - (charY - lineHeight) + character[3]
        end
    end

    self.words = words
end

function TitleState:update(dt)
    if love.keyboard.waspressed("space") then
        GStateMachine:change("play")
    end
end

function TitleState:draw()
    love.graphics.setColor(1, 1, 1, 1)
    for i = 1, #self.words do
        for _, character in pairs(self.words[i]) do
            love.graphics.draw(Texture, QuadsAlphabet[character[1]], character[2], character[3])
        end
    end

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(Texture, QuadsUI["controls"], 79, 116)
end
