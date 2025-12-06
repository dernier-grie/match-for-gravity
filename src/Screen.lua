Screen = {}

local Shake = {}

function Shake:new()
    local this = {
        ["x"] = 0,
        ["y"] = 0,
        ["sampleCount"] = 0,
        ["samplesX"] = {},
        ["samplesY"] = {},
        ["isShaking"] = false,
        ["t"] = 0,
        ["duration"] = 0,
        ["frequency"] = 0,
        ["amplitude"] = 0,
    }

    self.__index = self
    setmetatable(this, self)
    return this
end

function Shake:update(dt)
    if self.isShaking then
        self.t = self.t + dt
        local i = self.t / self.duration * self.sampleCount
        local index1 = math.floor(i)
        local index2 = index1 + 1

        if index2 > self.sampleCount then
            self.isShaking = false
            self.x = 0
            self.y = 0
        else
            local decay = (self.duration - self.t) / self.duration
            local x = (self.samplesX[index1] + (i - index1) * (self.samplesX[index2] - self.samplesX[index1])) *
                decay
            local y = (self.samplesY[index1] + (i - index1) * (self.samplesY[index2] - self.samplesY[index1])) *
                decay
            self.x = x * self.amplitude
            self.y = y * self.amplitude
        end
    end
end

local function getSamples(sampleCount)
    local samples = {}
    for i = 0, sampleCount do
        samples[i] = math.random() * 2 - 1
    end
    return samples
end

function Shake:shake(duration, frequency, amplitude)
    local sampleCount = math.floor(duration * frequency)
    self.sampleCount = sampleCount
    self.samplesX = getSamples(sampleCount)
    self.samplesY = getSamples(sampleCount)

    self.t = 0
    self.duration = duration
    self.frequency = frequency
    self.amplitude = amplitude
    self.isShaking = true
end

function Screen:new()
    local this = {
        ["_shake"] = Shake:new()
    }

    self.__index = self
    setmetatable(this, self)
    return this
end

function Screen:start()
    love.graphics.translate(self._shake.x, self._shake.y)
    love.graphics.scale(SCREEN_SCALE)
end

function Screen:finish()
end

function Screen:update(dt)
    self._shake:update(dt)
end

function Screen:shake(duration, frequency, amplitude)
    self._shake:shake(duration, frequency, amplitude)
end
