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
local __TSTL_CheckPoint = require("app.src.World.Entity.CheckPoint")
local CheckPoint = __TSTL_CheckPoint.CheckPoint
____exports.Teleporter = {}
local Teleporter = ____exports.Teleporter
Teleporter.name = "Teleporter"
Teleporter.__index = Teleporter
Teleporter.prototype = {}
Teleporter.prototype.__index = __TS__Index(Teleporter.prototype)
Teleporter.prototype.__newindex = __TS__NewIndex(Teleporter.prototype)
Teleporter.prototype.constructor = Teleporter
Teleporter.____super = CheckPoint
setmetatable(Teleporter, Teleporter.____super)
setmetatable(Teleporter.prototype, Teleporter.____super.prototype)
function Teleporter.new(...)
    local self = setmetatable({}, Teleporter.prototype)
    self:____constructor(...)
    return self
end
function Teleporter.prototype.____constructor(self, rectangle, worldMap, facing)
    CheckPoint.prototype.____constructor(self, rectangle, worldMap)
    self.facing = facing
end
function Teleporter.prototype.checkPointAction(self)
    if not self.next then
        return
    end
    local x = GetRectCenterX(self.next.rectangle)
    local y = GetRectCenterY(self.next.rectangle)
    SetUnitPosition(GetEnteringUnit(), x, y)
    SetUnitFacing(GetEnteringUnit(), self.facing)
    DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", x, y))
    IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(self.next.rectangle), GetRectCenterY(self.next.rectangle))
end
return ____exports
