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
____exports.CheckPoint = {}
local CheckPoint = ____exports.CheckPoint
CheckPoint.name = "CheckPoint"
CheckPoint.__index = CheckPoint
CheckPoint.prototype = {}
CheckPoint.prototype.____getters = {}
CheckPoint.prototype.__index = __TS__Index(CheckPoint.prototype)
CheckPoint.prototype.____setters = {}
CheckPoint.prototype.__newindex = __TS__NewIndex(CheckPoint.prototype)
CheckPoint.prototype.constructor = CheckPoint
function CheckPoint.new(...)
    local self = setmetatable({}, CheckPoint.prototype)
    self:____constructor(...)
    return self
end
function CheckPoint.prototype.____constructor(self, rectangle, worldMap)
    self.rectangle = rectangle
    self.worldMap = worldMap
    self.eventTrig = CreateTrigger()
    TriggerRegisterEnterRectSimple(self.eventTrig, rectangle)
    TriggerAddCondition(self.eventTrig, Condition(function() return self:verifyTargetCheckpoint() end))
    TriggerAddAction(self.eventTrig, function() return self:checkPointAction() end)
end
function CheckPoint.prototype.____getters.previous(self)
    return self._previous
end
function CheckPoint.prototype.____getters.next(self)
    return self._next
end
function CheckPoint.prototype.____setters.previous(self, value)
    self._previous = value
end
function CheckPoint.prototype.____setters.next(self, value)
    self._next = value
end
function CheckPoint.prototype.verifyTargetCheckpoint(self)
    print("Unit Enters")
    return true
end
function CheckPoint.prototype.checkPointAction(self)
    if not self.next then
        return
    end
    IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(self.next.rectangle), GetRectCenterY(self.next.rectangle))
    if UnitHasBuffBJ(GetEnteringUnit(), FourCC("B028")) then
    end
end
function CheckPoint.prototype.isEnteringUnitCreep(self)
    local ownerID = GetPlayerId(GetOwningPlayer(GetEnteringUnit()))
    local ____TS_switch13 = ownerID
    if ____TS_switch13 == COLOUR.NAVY then
        goto ____TS_switch13_case_0
    end
    if ____TS_switch13 == COLOUR.TURQUOISE then
        goto ____TS_switch13_case_1
    end
    if ____TS_switch13 == COLOUR.VOILET then
        goto ____TS_switch13_case_2
    end
    if ____TS_switch13 == COLOUR.WHEAT then
        goto ____TS_switch13_case_3
    end
    goto ____TS_switch13_case_default
    ::____TS_switch13_case_0::
    ::____TS_switch13_case_1::
    ::____TS_switch13_case_2::
    ::____TS_switch13_case_3::
    do
        return true
    end
    ::____TS_switch13_case_default::
    do
        return false
    end
    ::____TS_switch13_end::
end
return ____exports
