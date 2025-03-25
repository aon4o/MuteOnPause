local metadata = require("src.metadata")

local mod = RegisterMod(metadata.modName, 1)

local game = Game()
local music = MusicManager()

local wasPaused = false
local storedTrack = nil

function mod:run()
    local isPaused = game:IsPaused()

    if isPaused and not wasPaused then
        storedTrack = music:GetCurrentMusicID()
        music:Pause()
    elseif not isPaused and wasPaused then
        if storedTrack and storedTrack ~= Music.MUSIC_NULL then
            music:Resume()
        end
    end

    wasPaused = isPaused
end

return mod
