--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
function __TS__ArrayPush(arr, ...)
    local items = ({...})
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
end

local ____exports = {}
local __TSTL_Defender = require("app.src.World.Entity.Players.Defender")
local Defender = __TSTL_Defender.Defender
local __TSTL_GlobalSettings = require("app.src.World.GlobalSettings")
local enemies = __TSTL_GlobalSettings.enemies
local InitializeStaticSounds = __TSTL_GlobalSettings.InitializeStaticSounds
local players = __TSTL_GlobalSettings.players
local __TSTL_Attacker = require("app.src.World.Entity.Players.Attacker")
local Attacker = __TSTL_Attacker.Attacker
local __TSTL_WorldMap = require("app.src.World.WorldMap")
local WorldMap = __TSTL_WorldMap.WorldMap
____exports.WarcraftMaul = {}
local WarcraftMaul = ____exports.WarcraftMaul
WarcraftMaul.name = "WarcraftMaul"
WarcraftMaul.__index = WarcraftMaul
WarcraftMaul.prototype = {}
WarcraftMaul.prototype.__index = WarcraftMaul.prototype
WarcraftMaul.prototype.constructor = WarcraftMaul
function WarcraftMaul.new(...)
    local self = setmetatable({}, WarcraftMaul.prototype)
    self:____constructor(...)
    return self
end
function WarcraftMaul.prototype.____constructor(self)
    self.debugMode = false
    self.waveTimer = 90
    self.stringtest = "Hello player " .. tostring(GetPlayerName(Player(0)))
    if GetPlayerName(Player(0)) == "WorldEdit" then
        self.debugMode = true
    end
    if self.debugMode then
        self.waveTimer = 30
    end
    do
        local i = 0
        while i < 24 do
            if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                if GetPlayerController(Player(i)) == MAP_CONTROL_USER then
                    __TS__ArrayPush(players, Defender.new(i))
                end
            end
            i = i + 1
        end
    end
    __TS__ArrayPush(enemies, Attacker.new(COLOUR.NAVY))
    __TS__ArrayPush(enemies, Attacker.new(COLOUR.TURQUOISE))
    __TS__ArrayPush(enemies, Attacker.new(COLOUR.VOILET))
    __TS__ArrayPush(enemies, Attacker.new(COLOUR.WHEAT))
    for ____, enemy in ipairs(enemies) do
        for ____, enemyAlly in ipairs(enemies) do
            enemy:makeAlliance(enemyAlly)
        end
    end
    InitializeStaticSounds(nil)
    self.worldMap = WorldMap.new(self)
    if self.debugMode then
        CreateUnit(Player(COLOUR.RED), FourCC("e00B"), 0, 0, bj_UNIT_FACING)
    end
end
return ____exports
