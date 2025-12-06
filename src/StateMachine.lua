-- https://github.com/borntofrappe/game-development/tree/main/Utils/State%20Machine
StateMachine = {}

function StateMachine:new(states)
    local empty = {
        ["enter"] = function()
        end,
        ["exit"] = function()
        end,
        ["update"] = function()
        end,
        ["draw"] = function()
        end
    }

    local this = {
        ["empty"] = empty,
        ["states"] = states or {},
        ["current"] = empty
    }

    self.__index = self
    setmetatable(this, self)

    return this
end

function StateMachine:change(stateName, enterParams)
    assert(self.states[stateName], "Invalid state name: " .. stateName)

    self.current:exit()
    self.current = self.states[stateName]()
    self.current:enter(enterParams)
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:draw()
    self.current:draw()
end
