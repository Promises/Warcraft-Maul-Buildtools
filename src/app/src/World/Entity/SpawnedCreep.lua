--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.SpawnedCreep = {}
local SpawnedCreep = ____exports.SpawnedCreep
SpawnedCreep.name = "SpawnedCreep"
SpawnedCreep.__index = SpawnedCreep
SpawnedCreep.prototype = {}
SpawnedCreep.prototype.__index = SpawnedCreep.prototype
SpawnedCreep.prototype.constructor = SpawnedCreep
function SpawnedCreep.new(...)
    local self = setmetatable({}, SpawnedCreep.prototype)
    self:____constructor(...)
    return self
end
function SpawnedCreep.prototype.____constructor(self, creep)
    self.creep = creep
end
function SpawnedCreep.prototype.printId(self)
    print(GetUnitName(self.creep))
end
return ____exports
