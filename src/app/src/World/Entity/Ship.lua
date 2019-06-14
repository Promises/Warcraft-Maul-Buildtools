--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.Ship = {}
local Ship = ____exports.Ship
Ship.name = "Ship"
Ship.__index = Ship
Ship.prototype = {}
Ship.prototype.__index = Ship.prototype
Ship.prototype.constructor = Ship
function Ship.new(...)
    local self = setmetatable({}, Ship.prototype)
    self:____constructor(...)
    return self
end
function Ship.prototype.____constructor(self, ship)
    self.destination = Rect(-5440, -5664, -5184, -4864)
    self.ship = ship
end
return ____exports
