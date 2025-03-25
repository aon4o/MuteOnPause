local mod = require("src.mod")

mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.run)
