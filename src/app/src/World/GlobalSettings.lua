--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.players = {}
____exports.enemies = {}
____exports.ALLOW_PLAYER_TOWER_LOCATIONS = {
    {
        x = -1536,
        y = 5376,
    },
    {
        x = 640,
        y = 4992,
    },
    {
        x = 1536,
        y = 5376,
    },
    {
        x = 5120,
        y = 448,
    },
    {
        x = 768,
        y = 1984,
    },
    {
        x = -3616,
        y = 448,
    },
    {
        x = -4736,
        y = -2816,
    },
    {
        x = 4736,
        y = -2816,
    },
    {
        x = 512,
        y = -2176,
    },
    {
        x = -1536,
        y = -2176,
    },
    {
        x = 2816,
        y = -2176,
    },
    {
        x = -3712,
        y = 3456,
    },
    {
        x = 4992,
        y = 3456,
    },
}
____exports.COLOUR_CODES = {
    "ff0303",
    "0042ff",
    "1ce6b9",
    "540081",
    "fffc00",
    "fe8a0e",
    "20c000",
    "e55bb0",
    "959697",
    "7ebff1",
    "106246",
    "4a2a04",
    "9b0000",
    "0000c3",
    "00eaff",
    "be00fe",
    "ebcd87",
    "f8a48b",
    "bfff80",
    "dcb9eb",
    "282828",
    "ebf0ff",
    "00781e",
    "a46f33",
}
____exports.Sounds = {}
local Sounds = ____exports.Sounds
Sounds.name = "Sounds"
Sounds.__index = Sounds
Sounds.prototype = {}
Sounds.prototype.__index = Sounds.prototype
Sounds.prototype.constructor = Sounds
function Sounds.new(...)
    local self = setmetatable({}, Sounds.prototype)
    self:____constructor(...)
    return self
end
function Sounds.prototype.____constructor(self)
end
Sounds.loseALifeSound = CreateSound("Abilities\\Spells\\Other\\LoadUnload\\Loading.wav", false, false, true, 10, 10, "DefaultEAXON")
Sounds.goldSound = CreateSound("Abilities\\Spells\\Items\\ResourceItems\\ReceiveGold.wav", false, true, true, 10, 10, "DefaultEAXON")
Sounds.victorySound = CreateSound("Sound\\Music\\mp3Music\\PH1.mp3", false, false, false, 10, 10, "DefaultEAXON")
Sounds.defeatSound = CreateSound("Sound\\Music\\mp3Music\\TragicConfrontation.mp3", false, false, false, 10, 10, "DefaultEAXON")
Sounds.impossibleDifficultySound = CreateSound("Sound\\Music\\mp3Music\\PursuitTheme.mp3", false, false, false, 10, 10, "DefaultEAXON")
function ____exports.InitializeStaticSounds(self)
    SetSoundParamsFromLabel(____exports.Sounds.loseALifeSound, "LoadUnload")
    SetSoundDuration(____exports.Sounds.loseALifeSound, 740)
    SetSoundParamsFromLabel(____exports.Sounds.goldSound, "ReceiveGold")
    SetSoundDuration(____exports.Sounds.goldSound, 589)
    SetSoundChannel(____exports.Sounds.goldSound, 0)
    SetSoundDistances(____exports.Sounds.goldSound, 750, 1000)
end
return ____exports
