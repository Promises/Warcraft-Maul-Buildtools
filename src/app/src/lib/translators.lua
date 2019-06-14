--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
console = {}
console.name = "console"
console.__index = console
console.prototype = {}
console.prototype.__index = console.prototype
console.prototype.constructor = console
function console.new(...)
    local self = setmetatable({}, console.prototype)
    self:____constructor(...)
    return self
end
function console.prototype.____constructor(self)
end
function console.log(self, input)
    BJDebugMsg(input)
end
Util = {}
Util.name = "Util"
Util.__index = Util
Util.prototype = {}
Util.prototype.__index = Util.prototype
Util.prototype.constructor = Util
function Util.new(...)
    local self = setmetatable({}, Util.prototype)
    self:____constructor(...)
    return self
end
function Util.prototype.____constructor(self)
end
function Util.ColourString(self, colour, ____string)
    return "|cFF" .. tostring(colour) .. tostring(____string) .. "|r"
end
COLOUR = {}
COLOUR.RED = 0
COLOUR[0] = "RED"
COLOUR.BLUE = 1
COLOUR[1] = "BLUE"
COLOUR.TEAL = 2
COLOUR[2] = "TEAL"
COLOUR.PURPLE = 3
COLOUR[3] = "PURPLE"
COLOUR.YELLOW = 4
COLOUR[4] = "YELLOW"
COLOUR.ORANGE = 5
COLOUR[5] = "ORANGE"
COLOUR.GREEN = 6
COLOUR[6] = "GREEN"
COLOUR.PINK = 7
COLOUR[7] = "PINK"
COLOUR.GRAY = 8
COLOUR[8] = "GRAY"
COLOUR.LIGHT_BLUE = 9
COLOUR[9] = "LIGHT_BLUE"
COLOUR.DARK_GREEN = 10
COLOUR[10] = "DARK_GREEN"
COLOUR.BROWN = 11
COLOUR[11] = "BROWN"
COLOUR.MAROON = 12
COLOUR[12] = "MAROON"
COLOUR.NAVY = 13
COLOUR[13] = "NAVY"
COLOUR.TURQUOISE = 14
COLOUR[14] = "TURQUOISE"
COLOUR.VOILET = 15
COLOUR[15] = "VOILET"
COLOUR.WHEAT = 16
COLOUR[16] = "WHEAT"
COLOUR.PEACH = 17
COLOUR[17] = "PEACH"
COLOUR.MINT = 18
COLOUR[18] = "MINT"
COLOUR.LEVANDER = 19
COLOUR[19] = "LEVANDER"
COLOUR.COAL = 20
COLOUR[20] = "COAL"
COLOUR.SNOW = 21
COLOUR[21] = "SNOW"
COLOUR.EMERALD = 22
COLOUR[22] = "EMERALD"
COLOUR.PEANUT = 23
COLOUR[23] = "PEANUT"
CREEP_TYPE = {}
CREEP_TYPE.NORMAL = 0
CREEP_TYPE[0] = "NORMAL"
CREEP_TYPE.AIR = 1
CREEP_TYPE[1] = "AIR"
CREEP_TYPE.CHAMPION = 2
CREEP_TYPE[2] = "CHAMPION"
CREEP_TYPE.BOSS = 3
CREEP_TYPE[3] = "BOSS"
ARMOUR_TYPE = {}
ARMOUR_TYPE.UNARMOURED = 0
ARMOUR_TYPE[0] = "UNARMOURED"
ARMOUR_TYPE.LIGHT = 1
ARMOUR_TYPE[1] = "LIGHT"
ARMOUR_TYPE.MEDIUM = 2
ARMOUR_TYPE[2] = "MEDIUM"
ARMOUR_TYPE.HEAVY = 3
ARMOUR_TYPE[3] = "HEAVY"
ARMOUR_TYPE.FORTIFIED = 4
ARMOUR_TYPE[4] = "FORTIFIED"
ARMOUR_TYPE.HERO = 5
ARMOUR_TYPE[5] = "HERO"
