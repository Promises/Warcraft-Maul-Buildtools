--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local __TSTL_GlobalSettings = require("app.src.World.GlobalSettings")
local players = __TSTL_GlobalSettings.players
local __TSTL_AbstractPlayer = require("app.src.World.Entity.Players.AbstractPlayer")
local AbstractPlayer = __TSTL_AbstractPlayer.AbstractPlayer
____exports.Attacker = {}
local Attacker = ____exports.Attacker
Attacker.name = "Attacker"
Attacker.__index = Attacker
Attacker.prototype = {}
Attacker.prototype.__index = Attacker.prototype
Attacker.prototype.constructor = Attacker
Attacker.____super = AbstractPlayer
setmetatable(Attacker, Attacker.____super)
setmetatable(Attacker.prototype, Attacker.____super.prototype)
function Attacker.new(...)
    local self = setmetatable({}, Attacker.prototype)
    self:____constructor(...)
    return self
end
function Attacker.prototype.____constructor(self, id)
    AbstractPlayer.prototype.____constructor(self, id)
    SetPlayerName(self.wcPlayer, "Forces of Darkness")
    SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, self.wcPlayer)
    for ____, humanPlayer in ipairs(players) do
        SetPlayerAllianceStateBJ(humanPlayer.wcPlayer, self.wcPlayer, bj_ALLIANCE_UNALLIED)
    end
end
return ____exports
