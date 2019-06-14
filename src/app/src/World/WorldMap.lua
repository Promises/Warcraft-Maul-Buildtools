--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____symbolMetatable = {__tostring = function(self)
    if self.description == nil then
        return "Symbol()"
    else
        return "Symbol(" .. tostring(self.description) .. ")"
    end
end}
function __TS__Symbol(description)
    return setmetatable({description = description}, ____symbolMetatable)
end
Symbol = {
    iterator = __TS__Symbol("Symbol.iterator"),
    hasInstance = __TS__Symbol("Symbol.hasInstance"),
    species = __TS__Symbol("Symbol.species"),
    toStringTag = __TS__Symbol("Symbol.toStringTag"),
}

--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
function __TS__InstanceOf(obj, classTbl)
    if (type(classTbl) == "table" and "object" or type(classTbl)) ~= "object" then
        error("Right-hand side of \'instanceof\' is not an object")
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not not classTbl[Symbol.hasInstance](classTbl, obj)
    end
    if obj ~= nil then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
function __TS__Iterator(iterable)
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        return function()
            local result = iterator:next()
            if not result.done then
                return result.value
            else
                return nil
            end
        end
    else
        local i = 0
        return function()
            i = i + 1
            return iterable[i]
        end
    end
end

--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
Map = (function()
    Map = {}
    Map.name = "Map"
    Map.__index = Map
    Map.prototype = {}
    Map.prototype.__index = Map.prototype
    Map.prototype.constructor = Map
    function Map.new(...)
        local self = setmetatable({}, Map.prototype)
        self:____constructor(...)
        return self
    end
    function Map.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "Map"
        self.items = {}
        self.size = 0
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[1], value[2])
            end
        else
            local array = entries
            self.size = #array
            for ____, kvp in ipairs(array) do
                self.items[kvp[1]] = kvp[2]
            end
        end
    end
    function Map.prototype.clear(self)
        self.items = {}
        self.size = 0
        return
    end
    function Map.prototype.delete(self, key)
        local contains = self:has(key)
        if contains then
            self.size = self.size - 1
        end
        self.items[key] = nil
        return contains
    end
    function Map.prototype.forEach(self, callback)
        for key in pairs(self.items) do
            callback(_G, self.items[key], key, self)
        end
        return
    end
    function Map.prototype.get(self, key)
        return self.items[key]
    end
    function Map.prototype.has(self, key)
        return self.items[key] ~= nil
    end
    function Map.prototype.set(self, key, value)
        if not self:has(key) then
            self.size = self.size + 1
        end
        self.items[key] = value
        return self
    end
    Map.prototype[Symbol.iterator] = function(self)
        return self:entries()
    end
    function Map.prototype.entries(self)
        local items = self.items
        local key
        local value
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                key, value = next(items, key)
                return {
                    done = not key,
                    value = {
                        key,
                        value,
                    },
                }
            end,
        }
    end
    function Map.prototype.keys(self)
        local items = self.items
        local key
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                key = next(items, key)
                return {
                    done = not key,
                    value = key,
                }
            end,
        }
    end
    function Map.prototype.values(self)
        local items = self.items
        local key
        local value
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                key, value = next(items, key)
                return {
                    done = not key,
                    value = value,
                }
            end,
        }
    end
    Map[Symbol.species] = Map
    return Map
end)()

--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
function __TS__ArrayPush(arr, ...)
    local items = ({...})
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
end

local ____exports = {}
local __TSTL_Ship = require("app.src.World.Entity.Ship")
local Ship = __TSTL_Ship.Ship
local __TSTL_Creep = require("app.src.World.Entity.Creep")
local Creep = __TSTL_Creep.Creep
local __TSTL_Race = require("app.src.World.Game.Race")
local Race = __TSTL_Race.Race
local __TSTL_PlayerSpawns = require("app.src.World.Entity.PlayerSpawns")
local PlayerSpawns = __TSTL_PlayerSpawns.PlayerSpawns
local __TSTL_SpawnedCreeps = require("app.src.World.Entity.SpawnedCreeps")
local SpawnedCreeps = __TSTL_SpawnedCreeps.SpawnedCreeps
local __TSTL_CheckPoint = require("app.src.World.Entity.CheckPoint")
local CheckPoint = __TSTL_CheckPoint.CheckPoint
local __TSTL_Teleporter = require("app.src.World.Entity.Teleporter")
local Teleporter = __TSTL_Teleporter.Teleporter
____exports.WorldMap = {}
local WorldMap = ____exports.WorldMap
WorldMap.name = "WorldMap"
WorldMap.__index = WorldMap
WorldMap.prototype = {}
WorldMap.prototype.__index = WorldMap.prototype
WorldMap.prototype.constructor = WorldMap
function WorldMap.new(...)
    local self = setmetatable({}, WorldMap.prototype)
    self:____constructor(...)
    return self
end
function WorldMap.prototype.____constructor(self, game)
    self.worldCreatures = Map.new()
    self.creeps = {}
    self.races = {}
    self.playerSpawns = {}
    self.game = game
    self:setupWorldCreatures()
end
function WorldMap.prototype.setupWorldCreatures(self)
    self.ship = Ship.new(CreateUnit(Player(13), FourCC("n05G"), 63, -5343.5, 0))
    self:createCreepWaves()
    self:createDummyCreeps()
    self:setupRaces()
    self.spawnedCreeps = SpawnedCreeps.new()
    self:setupCheckpoint()
end
function WorldMap.prototype.createDummyCreeps(self)
    local dummyWaves = {}
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("u006"), 1664, 3072, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC04"), 1792, 3072, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("eC05"), 1920, 3072, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC16"), 2048, 3072, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC17"), 2176, 3072, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC29"), 1664, 2944, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("o01C"), 1792, 2944, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC30"), 1920, 2944, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("oC31"), 2048, 2944, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC33"), 2176, 2944, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("n008"), 1664, 2816, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("eC38"), 1792, 2816, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC39"), 1920, 2816, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC40"), 2048, 2816, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC41"), 2176, 2816, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC42"), 1664, 2688, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("uC43"), 1792, 2688, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC44"), 1920, 2688, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("uC45"), 2048, 2688, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("n004"), 2176, 2688, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC48"), 1664, 2560, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("oC47"), 1792, 2560, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC49"), 1920, 2560, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC50"), 2048, 2560, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC51"), 2176, 2560, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC69"), 1664, 2432, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("eC52"), 1792, 2432, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("oC70"), 1920, 2432, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC95"), 2048, 2432, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("uC71"), 2176, 2432, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC76"), 1664, 2304, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("h03Y"), 1792, 2304, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("h03Z"), 1920, 2304, 270))
    __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("h040"), 2048, 2304, 270))
    for ____, wave in ipairs(dummyWaves) do
        SetUnitInvulnerable(wave, true)
        PauseUnit(wave, true)
    end
    self.archimondeDummy = CreateUnit(Player(COLOUR.NAVY), FourCC("u000"), 4868, -4964, 240)
    PauseUnitBJ(true, self.archimondeDummy)
end
function WorldMap.prototype.createCreepWaves(self)
    __TS__ArrayPush(self.creeps, Creep.new(1, "u006", "Wisp"))
    __TS__ArrayPush(self.creeps, Creep.new(2, "hC04", "Clockwerk"))
    __TS__ArrayPush(self.creeps, Creep.new(3, "eC05", "Acolyte"))
    __TS__ArrayPush(self.creeps, Creep.new(4, "hC16", "Militia"))
    __TS__ArrayPush(self.creeps, Creep.new(5, "nC17", "Wind Rider"))
    __TS__ArrayPush(self.creeps, Creep.new(6, "nC29", "Tauren Mystic"))
    __TS__ArrayPush(self.creeps, Creep.new(7, "o01C", "Grunt"))
    __TS__ArrayPush(self.creeps, Creep.new(8, "nC30", "Makrura Snapper"))
    __TS__ArrayPush(self.creeps, Creep.new(9, "oC31", "Mutant"))
    __TS__ArrayPush(self.creeps, Creep.new(10, "nC33", "Mini-Tank"))
    __TS__ArrayPush(self.creeps, Creep.new(11, "n008", "Enraged Yeti"))
    __TS__ArrayPush(self.creeps, Creep.new(12, "eC38", "Faceless Brute"))
    __TS__ArrayPush(self.creeps, Creep.new(13, "nC39", "Stampeding Reptile"))
    __TS__ArrayPush(self.creeps, Creep.new(14, "nC40", "Nymph"))
    __TS__ArrayPush(self.creeps, Creep.new(15, "nC41", "Matured Dragon"))
    __TS__ArrayPush(self.creeps, Creep.new(16, "nC42", "Merfolk Champion"))
    __TS__ArrayPush(self.creeps, Creep.new(17, "uC43", "Eternal Spirit"))
    __TS__ArrayPush(self.creeps, Creep.new(18, "hC44", "Granite Golem"))
    __TS__ArrayPush(self.creeps, Creep.new(19, "uC45", "Walking Corpse"))
    __TS__ArrayPush(self.creeps, Creep.new(20, "n004", "Adult Dragon"))
    __TS__ArrayPush(self.creeps, Creep.new(21, "hC48", "Bear"))
    __TS__ArrayPush(self.creeps, Creep.new(22, "oC47", "Heavy Tank"))
    __TS__ArrayPush(self.creeps, Creep.new(23, "nC49", "Big Game Hunter"))
    __TS__ArrayPush(self.creeps, Creep.new(24, "nC50", "Water Spirit"))
    __TS__ArrayPush(self.creeps, Creep.new(25, "nC51", "Ancient Dragon"))
    __TS__ArrayPush(self.creeps, Creep.new(26, "nC69", "Steel Golem"))
    __TS__ArrayPush(self.creeps, Creep.new(27, "eC52", "Demonic Minion"))
    __TS__ArrayPush(self.creeps, Creep.new(28, "oC70", "Fire Spirit"))
    __TS__ArrayPush(self.creeps, Creep.new(29, "hC95", "Demon Queen"))
    __TS__ArrayPush(self.creeps, Creep.new(30, "uC71", "Nether Dragon"))
    __TS__ArrayPush(self.creeps, Creep.new(31, "hC76", "Blood Golem"))
    __TS__ArrayPush(self.creeps, Creep.new(32, "h03Y", "Big Bad Ogre"))
    __TS__ArrayPush(self.creeps, Creep.new(33, "h03Z", "Snap Dragon"))
    __TS__ArrayPush(self.creeps, Creep.new(34, "h040", "Zergling"))
    __TS__ArrayPush(self.creeps, Creep.new(35, "uC72", "Archimonde"))
    __TS__ArrayPush(self.creeps, Creep.new(36, "hC79", "CRAB OF DEATH"))
end
function WorldMap.prototype.setupRaces(self)
    __TS__ArrayPush(self.races, Race.new("h03L", "Workers Union"))
    __TS__ArrayPush(self.races, Race.new("uC98", "Demon Portal"))
    __TS__ArrayPush(self.races, Race.new("oC22", "Undead Necropolis"))
    __TS__ArrayPush(self.races, Race.new("eC10", "Aviaries"))
    __TS__ArrayPush(self.races, Race.new("u002", "High Elf Barracks"))
    __TS__ArrayPush(self.races, Race.new("u001", "Outland"))
    __TS__ArrayPush(self.races, Race.new("hC07", "Human Town Hall"))
    __TS__ArrayPush(self.races, Race.new("nC03", "Orc Stronghold"))
    __TS__ArrayPush(self.races, Race.new("n03W", "High Elf Farm"))
    __TS__ArrayPush(self.races, Race.new("uC13", "Giants Hall"))
    __TS__ArrayPush(self.races, Race.new("e00A", "The Unique"))
    __TS__ArrayPush(self.races, Race.new("e007", "The Summons"))
    __TS__ArrayPush(self.races, Race.new("n00J", "Arachnid Hive"))
    __TS__ArrayPush(self.races, Race.new("o017", "Draenei Haven"))
    __TS__ArrayPush(self.races, Race.new("u00B", "Dragons"))
    __TS__ArrayPush(self.races, Race.new("e00F", "Night Elf Ancient"))
    __TS__ArrayPush(self.races, Race.new("e00W", "Elementalists"))
    __TS__ArrayPush(self.races, Race.new("e002", "Tavern"))
    __TS__ArrayPush(self.races, Race.new("e003", "Corrupted Night Elves"))
    __TS__ArrayPush(self.races, Race.new("e005", "Goblins"))
    __TS__ArrayPush(self.races, Race.new("n03M", "Heros Altar"))
    __TS__ArrayPush(self.races, Race.new("e00D", "Caerbannog"))
    __TS__ArrayPush(self.races, Race.new("n01V", "Critters UNITE"))
    __TS__ArrayPush(self.races, Race.new("n02A", "Gnoll Republic"))
    __TS__ArrayPush(self.races, Race.new("h02T", "Void Cult"))
    __TS__ArrayPush(self.races, Race.new("n02S", "Alliance of Blades"))
    __TS__ArrayPush(self.races, Race.new("n03C", "Cavernous Creatures"))
    __TS__ArrayPush(self.races, Race.new("n046", "Forest Troll Hut"))
    __TS__ArrayPush(self.races, Race.new("n014", "Ice Troll Hut"))
    __TS__ArrayPush(self.races, Race.new("n03W", "Dark Troll Hut"))
    __TS__ArrayPush(self.races, Race.new("n04I", "The Forsaken"))
    __TS__ArrayPush(self.races, Race.new("e00H", "Dwarven Mine"))
    __TS__ArrayPush(self.races, Race.new("e00G", "Galaxy"))
    __TS__ArrayPush(self.races, Race.new("u01B", "Shrine of Buffs"))
end
function WorldMap.prototype.setupCheckpoint(self)
    local RedSpawns = PlayerSpawns.new(self)
    RedSpawns.spawnOne = CheckPoint.new(Rect(-1792, 4736, -1472, 5056), self)
    RedSpawns.spawnTwo = CheckPoint.new(Rect(-1792, 4416, -1472, 4736), self)
    __TS__ArrayPush(self.playerSpawns, RedSpawns)
    local RedCheckpoint = RedSpawns.spawnOne
    RedCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(RedCheckpoint, "next", CheckPoint.new(Rect(-2464, 4704, -2400, 4768), self))
    RedCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(RedCheckpoint, "next", CheckPoint.new(Rect(-3616, 4704, -3552, 4768), self))
    RedCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(RedCheckpoint, "next", Teleporter.new(Rect(-4384, 4704, -4320, 4768), self, 270))
    RedCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(RedCheckpoint, "next", CheckPoint.new(Rect(-4384, 3392, -4320, 3456), self))
    local BlueSpawns = PlayerSpawns.new(self)
    BlueSpawns.spawnOne = CheckPoint.new(Rect(-320, 4768, 0, 5088), self)
    BlueSpawns.spawnTwo = CheckPoint.new(Rect(0, 4768, 320, 5088), self)
    __TS__ArrayPush(self.playerSpawns, BlueSpawns)
    local TealSpawns = PlayerSpawns.new(self)
    TealSpawns.spawnOne = CheckPoint.new(Rect(1472, 4768, 1792, 5088), self)
    TealSpawns.spawnTwo = CheckPoint.new(Rect(1472, 4448, 1792, 4768), self)
    __TS__ArrayPush(self.playerSpawns, TealSpawns)
    local PurpleSpawns = PlayerSpawns.new(self)
    PurpleSpawns.spawnOne = CheckPoint.new(Rect(4032, 128, 4352, 448), self)
    PurpleSpawns.spawnTwo = CheckPoint.new(Rect(4352, 128, 4672, 448), self)
    __TS__ArrayPush(self.playerSpawns, PurpleSpawns)
    local YellowSpawns = PlayerSpawns.new(self)
    YellowSpawns.spawnOne = CheckPoint.new(Rect(-320, 1664, 0, 1984), self)
    YellowSpawns.spawnTwo = CheckPoint.new(Rect(0, 1664, 320, 1984), self)
    __TS__ArrayPush(self.playerSpawns, YellowSpawns)
    local OrangeSpawns = PlayerSpawns.new(self)
    OrangeSpawns.spawnOne = CheckPoint.new(Rect(-4672, 128, -4352, 448), self)
    OrangeSpawns.spawnTwo = CheckPoint.new(Rect(-4352, 128, -4032, 448), self)
    __TS__ArrayPush(self.playerSpawns, OrangeSpawns)
    local OrangeCheckpoint = OrangeSpawns.spawnOne
    OrangeCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(OrangeCheckpoint, "next", CheckPoint.new(Rect(-4384, -544, -4320, -480), self))
    OrangeCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(OrangeCheckpoint, "next", CheckPoint.new(Rect(-4384, -1696, -4320, -1632), self))
    OrangeCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(OrangeCheckpoint, "next", Teleporter.new(Rect(-4384, -2464, -4320, -2400), self, 0))
    OrangeCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(OrangeCheckpoint, "next", CheckPoint.new(Rect(-4768, -3488, -4704, -3424), self))
    local GreenSpawns = PlayerSpawns.new(self)
    GreenSpawns.spawnOne = CheckPoint.new(Rect(-4800, -3456, -4480, -3136), self)
    GreenSpawns.spawnTwo = CheckPoint.new(Rect(-4800, -3776, -4480, -3456), self)
    __TS__ArrayPush(self.playerSpawns, GreenSpawns)
    local GreenCheckpoint = GreenSpawns.spawnOne
    GreenCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(GreenCheckpoint, "next", CheckPoint.new(Rect(-3872, -3488, -3808, -3424), self))
    GreenCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(GreenCheckpoint, "next", CheckPoint.new(Rect(-2720, -3488, -2656, -3424), self))
    GreenCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(GreenCheckpoint, "next", Teleporter.new(Rect(-1952, -3488, -1888, -3424), self, 270))
    local PinkSpawns = PlayerSpawns.new(self)
    PinkSpawns.spawnOne = CheckPoint.new(Rect(4480, -3456, 4800, -3136), self)
    PinkSpawns.spawnTwo = CheckPoint.new(Rect(4480, -3776, 4800, -3456), self)
    __TS__ArrayPush(self.playerSpawns, PinkSpawns)
    local GreysSpawns = PlayerSpawns.new(self)
    GreysSpawns.spawnOne = CheckPoint.new(Rect(-160, -2464, 160, -2144), self)
    __TS__ArrayPush(self.playerSpawns, GreysSpawns)
    local GreysCheckpoint = GreysSpawns.spawnOne
    GreysCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(GreysCheckpoint, "next", CheckPoint.new(Rect(-32, -3104, 32, -3040), self))
    GreysCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(GreysCheckpoint, "next", CheckPoint.new(Rect(-32, -4256, 32, -4192), self))
    GreysCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(GreysCheckpoint, "next", CheckPoint.new(Rect(-768, -4992, 768, -4800), self))
    local LightBlueSpawns = PlayerSpawns.new(self)
    LightBlueSpawns.spawnOne = CheckPoint.new(Rect(-2496, -2240, -2176, -1920), self)
    LightBlueSpawns.spawnTwo = CheckPoint.new(Rect(-2176, -2240, -1856, -1920), self)
    __TS__ArrayPush(self.playerSpawns, LightBlueSpawns)
    local DarkGreenSpawns = PlayerSpawns.new(self)
    DarkGreenSpawns.spawnOne = CheckPoint.new(Rect(1856, -2240, 2176, -1920), self)
    DarkGreenSpawns.spawnTwo = CheckPoint.new(Rect(2176, -2240, 2496, -1920), self)
    __TS__ArrayPush(self.playerSpawns, DarkGreenSpawns)
    local BrownSpawns = PlayerSpawns.new(self)
    BrownSpawns.spawnOne = CheckPoint.new(Rect(-4672, 3200, -4352, 3520), self)
    BrownSpawns.spawnTwo = CheckPoint.new(Rect(-4352, 3200, -4032, 3520), self)
    __TS__ArrayPush(self.playerSpawns, BrownSpawns)
    local BrownCheckpoint = BrownSpawns.spawnOne
    BrownCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(BrownCheckpoint, "next", CheckPoint.new(Rect(-4384, 2528, -4320, 2592), self))
    BrownCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(BrownCheckpoint, "next", CheckPoint.new(Rect(-4384, 1376, -4320, 1440), self))
    local MaroonsSpawns = PlayerSpawns.new(self)
    MaroonsSpawns.spawnOne = CheckPoint.new(Rect(4032, 3200, 4352, 3520), self)
    MaroonsSpawns.spawnTwo = CheckPoint.new(Rect(4352, 3200, 4672, 3520), self)
    __TS__ArrayPush(self.playerSpawns, MaroonsSpawns)
    RedCheckpoint.next = BrownSpawns.spawnOne.next
    BrownCheckpoint.next = OrangeSpawns.spawnOne.next
    OrangeCheckpoint.next = GreenSpawns.spawnOne.next
    GreenCheckpoint.next = GreysSpawns.spawnOne
end
return ____exports
