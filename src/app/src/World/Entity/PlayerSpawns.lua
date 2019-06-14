--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
function __TS__Index(classProto)
    return function(tbl, key)
        local proto = classProto
        while true do
            local val = rawget(proto, key)
            if val ~= nil then
                return val
            end
            local getters = rawget(proto, "____getters")
            if getters then
                local getter
                getter = getters[key]
                if getter then
                    return getter(tbl)
                end
            end
            local base = rawget(rawget(proto, "constructor"), "____super")
            if not base then
                break
            end
            proto = rawget(base, "prototype")
        end
    end
end

--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
function __TS__NewIndex(classProto)
    return function(tbl, key, val)
        local proto = classProto
        while true do
            local setters = rawget(proto, "____setters")
            if setters then
                local setter
                setter = setters[key]
                if setter then
                    setter(tbl, val)
                    return
                end
            end
            local base = rawget(rawget(proto, "constructor"), "____super")
            if not base then
                break
            end
            proto = rawget(base, "prototype")
        end
        rawset(tbl, key, val)
    end
end

local ____exports = {}
____exports.PlayerSpawns = {}
local PlayerSpawns = ____exports.PlayerSpawns
PlayerSpawns.name = "PlayerSpawns"
PlayerSpawns.__index = PlayerSpawns
PlayerSpawns.prototype = {}
PlayerSpawns.prototype.____getters = {}
PlayerSpawns.prototype.__index = __TS__Index(PlayerSpawns.prototype)
PlayerSpawns.prototype.____setters = {}
PlayerSpawns.prototype.__newindex = __TS__NewIndex(PlayerSpawns.prototype)
PlayerSpawns.prototype.constructor = PlayerSpawns
function PlayerSpawns.new(...)
    local self = setmetatable({}, PlayerSpawns.prototype)
    self:____constructor(...)
    return self
end
function PlayerSpawns.prototype.____constructor(self, worldMap)
    self.worldMap = worldMap
end
function PlayerSpawns.prototype.____getters.spawnOne(self)
    return self._spawnOne
end
function PlayerSpawns.prototype.____getters.spawnTwo(self)
    if self._spawnTwo == nil then
        return self.spawnOne
    end
    return self._spawnTwo
end
function PlayerSpawns.prototype.____setters.spawnOne(self, value)
    self._spawnOne = value
    if self.spawnOne then
        self.oneTrig = CreateTrigger()
        TriggerRegisterEnterRectSimple(self.oneTrig, self.spawnOne.rectangle)
        TriggerAddCondition(self.oneTrig, Condition(function() return self:EnteringUnitIsCreepAndHasNoCheckpoint() end))
        TriggerAddAction(self.oneTrig, function() return self:SpawnAction(self.spawnOne) end)
    end
end
function PlayerSpawns.prototype.____setters.spawnTwo(self, value)
    self._spawnTwo = value
    if self.spawnTwo then
        self.twoTrig = CreateTrigger()
        TriggerRegisterEnterRectSimple(self.twoTrig, self.spawnTwo.rectangle)
        TriggerAddCondition(self.twoTrig, Condition(function() return self:EnteringUnitIsCreepAndHasNoCheckpoint() end))
        TriggerAddAction(self.twoTrig, function() return self:SpawnAction(self.spawnTwo) end)
    end
end
function PlayerSpawns.prototype.EnteringUnitIsCreepAndHasNoCheckpoint(self)
    return true
end
function PlayerSpawns.prototype.isEnteringUnitCreep(self)
    local ownerID = GetPlayerId(GetOwningPlayer(GetEnteringUnit()))
    local ____TS_switch15 = ownerID
    if ____TS_switch15 == COLOUR.NAVY then
        goto ____TS_switch15_case_0
    end
    if ____TS_switch15 == COLOUR.TURQUOISE then
        goto ____TS_switch15_case_1
    end
    if ____TS_switch15 == COLOUR.VOILET then
        goto ____TS_switch15_case_2
    end
    if ____TS_switch15 == COLOUR.WHEAT then
        goto ____TS_switch15_case_3
    end
    goto ____TS_switch15_case_default
    ::____TS_switch15_case_0::
    ::____TS_switch15_case_1::
    ::____TS_switch15_case_2::
    ::____TS_switch15_case_3::
    do
        return true
    end
    ::____TS_switch15_case_default::
    do
        return false
    end
    ::____TS_switch15_end::
end
function PlayerSpawns.prototype.SpawnAction(self, spawn)
    if not spawn.next then
        return
    end
    IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(spawn.next.rectangle), GetRectCenterY(spawn.next.rectangle))
    self:AddCreepAbilities()
end
function PlayerSpawns.prototype.AddCreepAbilities(self)
end
return ____exports
