--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.Race = {}
local Race = ____exports.Race
Race.name = "Race"
Race.__index = Race
Race.prototype = {}
Race.prototype.__index = Race.prototype
Race.prototype.constructor = Race
function Race.new(...)
    local self = setmetatable({}, Race.prototype)
    self:____constructor(...)
    return self
end
function Race.prototype.____constructor(self, id, name)
    self.id = id
    self.name = name
end
return ____exports
