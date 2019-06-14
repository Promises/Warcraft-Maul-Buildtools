--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local __TSTL_AbstractPlayer = require("app.src.World.Entity.Players.AbstractPlayer")
local AbstractPlayer = __TSTL_AbstractPlayer.AbstractPlayer
local __TSTL_GlobalSettings = require("app.src.World.GlobalSettings")
local ALLOW_PLAYER_TOWER_LOCATIONS = __TSTL_GlobalSettings.ALLOW_PLAYER_TOWER_LOCATIONS
____exports.Defender = {}
local Defender = ____exports.Defender
Defender.name = "Defender"
Defender.__index = Defender
Defender.prototype = {}
Defender.prototype.__index = Defender.prototype
Defender.prototype.constructor = Defender
Defender.____super = AbstractPlayer
setmetatable(Defender, Defender.____super)
setmetatable(Defender.prototype, Defender.____super.prototype)
function Defender.new(...)
    local self = setmetatable({}, Defender.prototype)
    self:____constructor(...)
    return self
end
function Defender.prototype.____constructor(self, id)
    AbstractPlayer.prototype.____constructor(self, id)
    self:setUpPlayerVariables()
end
function Defender.prototype.setUpPlayerVariables(self)
    CreateFogModifierRectBJ(true, self.wcPlayer, FOG_OF_WAR_VISIBLE, GetPlayableMapRect())
    SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, self.id == COLOUR.GRAY and 150 or 100)
    SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, 1)
    self:sendMessage("Hello " .. tostring(self:getNameWithColour()) .. ", you are playing as " .. tostring(self:getPlayerColour()))
    local allowTowerLoc = ALLOW_PLAYER_TOWER_LOCATIONS[self.id + 1]
    self.allowPlayerTower = CreateUnit(self.wcPlayer, FourCC("h03S"), allowTowerLoc.x, allowTowerLoc.y, 0)
end
return ____exports
