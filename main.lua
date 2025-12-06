require "src/Dependencies"

local screen = Screen:new()
local world = World:new()

function love.load()
    love.window.setTitle(SCREEN_TITLE)
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)

    love.keyboard.keypressed = {}
end

function love.update(dt)
    -- update logic

    love.keyboard.keypressed = {}
end

function love.draw()
    screen:start()
    world:draw()

    screen:finish()
end

function love.keyboard.waspressed(key)
    return love.keyboard.keypressed[key] == true
end

-- quit on escape
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keypressed[key] = true
end
