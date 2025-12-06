require "src/Dependencies"

local screen = Screen:new()

function love.load()
    love.window.setTitle(SCREEN_TITLE)
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)
end

function love.update(dt)

end

function love.draw()
    screen:start()

    love.graphics.draw(Texture, QuadsAlphabet["a"], 0, 0)

    screen:finish()
end

-- quit on escape
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
