require "src/Dependencies"

local screen = Screen:new()
local world = World:new()

function love.load()
    love.window.setTitle(SCREEN_TITLE)
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)

    love.keyboard.keypressed = {}

    GStateMachine =
        StateMachine:new(
            {
                ["title"] = function()
                    return TitleState:new()
                end,
                ["play"] = function()
                    return PlayState:new()
                end,
            }
        )
    GStateMachine:change("play")
end

function love.update(dt)
    GStateMachine:update(dt)

    love.keyboard.keypressed = {}
end

function love.draw()
    screen:start()
    world:draw()

    GStateMachine:draw()

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
