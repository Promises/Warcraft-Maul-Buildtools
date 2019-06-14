--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local __TSTL_GlobalSettings = require("app.src.World.GlobalSettings")
local COLOUR_CODES = __TSTL_GlobalSettings.COLOUR_CODES
____exports.AbstractPlayer = {}
local AbstractPlayer = ____exports.AbstractPlayer
AbstractPlayer.name = "AbstractPlayer"
AbstractPlayer.__index = AbstractPlayer
AbstractPlayer.prototype = {}
AbstractPlayer.prototype.__index = AbstractPlayer.prototype
AbstractPlayer.prototype.constructor = AbstractPlayer
function AbstractPlayer.new(...)
    local self = setmetatable({}, AbstractPlayer.prototype)
    self:____constructor(...)
    return self
end
function AbstractPlayer.prototype.____constructor(self, id)
    self.id = id
    self.wcPlayer = Player(id)
end
function AbstractPlayer.prototype.makeAlliance(self, otherPlayer)
    SetPlayerAllianceStateBJ(self.wcPlayer, otherPlayer.wcPlayer, bj_ALLIANCE_ALLIED_VISION)
end
function AbstractPlayer.prototype.getPlayerColour(self)
    return string.lower(COLOUR[self.id])
end
function AbstractPlayer.prototype.getColourCode(self)
    return COLOUR_CODES[self.id + 1]
end
function AbstractPlayer.prototype.getNameWithColour(self)
    return Util:ColourString(self:getColourCode(), self:getPlayerName())
end
function AbstractPlayer.prototype.getPlayerName(self)
    return GetPlayerName(self.wcPlayer)
end
function AbstractPlayer.prototype.sendMessage(self, message)
    DisplayTimedTextToPlayer(self.wcPlayer, 0, 0, 5, message)
end
return ____exports
