--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.Creep = {}
local Creep = ____exports.Creep
Creep.name = "Creep"
Creep.__index = Creep
Creep.prototype = {}
Creep.prototype.__index = Creep.prototype
Creep.prototype.constructor = Creep
function Creep.new(...)
    local self = setmetatable({}, Creep.prototype)
    self:____constructor(...)
    return self
end
function Creep.prototype.____constructor(self, wave, id, name)
    self.wave = wave
    self.id = id
    self.name = name
    self.type = self:getCreepType()
    self:getArmourType()
end
function Creep.prototype.getCreepType(self)
    local ____TS_switch3 = self.wave
    if ____TS_switch3 == 5 then
        goto ____TS_switch3_case_0
    end
    if ____TS_switch3 == 15 then
        goto ____TS_switch3_case_1
    end
    if ____TS_switch3 == 20 then
        goto ____TS_switch3_case_2
    end
    if ____TS_switch3 == 25 then
        goto ____TS_switch3_case_3
    end
    if ____TS_switch3 == 30 then
        goto ____TS_switch3_case_4
    end
    if ____TS_switch3 == 9 then
        goto ____TS_switch3_case_5
    end
    if ____TS_switch3 == 14 then
        goto ____TS_switch3_case_6
    end
    if ____TS_switch3 == 19 then
        goto ____TS_switch3_case_7
    end
    if ____TS_switch3 == 24 then
        goto ____TS_switch3_case_8
    end
    if ____TS_switch3 == 29 then
        goto ____TS_switch3_case_9
    end
    if ____TS_switch3 == 31 then
        goto ____TS_switch3_case_10
    end
    if ____TS_switch3 == 35 then
        goto ____TS_switch3_case_11
    end
    goto ____TS_switch3_case_default
    ::____TS_switch3_case_0::
    ::____TS_switch3_case_1::
    ::____TS_switch3_case_2::
    ::____TS_switch3_case_3::
    ::____TS_switch3_case_4::
    do
        return CREEP_TYPE.AIR
    end
    ::____TS_switch3_case_5::
    ::____TS_switch3_case_6::
    ::____TS_switch3_case_7::
    ::____TS_switch3_case_8::
    ::____TS_switch3_case_9::
    ::____TS_switch3_case_10::
    do
        return CREEP_TYPE.CHAMPION
    end
    ::____TS_switch3_case_11::
    do
        return CREEP_TYPE.BOSS
    end
    ::____TS_switch3_case_default::
    do
        return CREEP_TYPE.NORMAL
    end
    ::____TS_switch3_end::
end
function Creep.prototype.getArmourType(self)
    local ____TS_switch5 = self.wave
    if ____TS_switch5 == 1 then
        goto ____TS_switch5_case_0
    end
    if ____TS_switch5 == 6 then
        goto ____TS_switch5_case_1
    end
    if ____TS_switch5 == 9 then
        goto ____TS_switch5_case_2
    end
    if ____TS_switch5 == 14 then
        goto ____TS_switch5_case_3
    end
    if ____TS_switch5 == 21 then
        goto ____TS_switch5_case_4
    end
    if ____TS_switch5 == 29 then
        goto ____TS_switch5_case_5
    end
    if ____TS_switch5 == 34 then
        goto ____TS_switch5_case_6
    end
    if ____TS_switch5 == 4 then
        goto ____TS_switch5_case_7
    end
    if ____TS_switch5 == 8 then
        goto ____TS_switch5_case_8
    end
    if ____TS_switch5 == 11 then
        goto ____TS_switch5_case_9
    end
    if ____TS_switch5 == 16 then
        goto ____TS_switch5_case_10
    end
    if ____TS_switch5 == 19 then
        goto ____TS_switch5_case_11
    end
    if ____TS_switch5 == 23 then
        goto ____TS_switch5_case_12
    end
    if ____TS_switch5 == 27 then
        goto ____TS_switch5_case_13
    end
    if ____TS_switch5 == 32 then
        goto ____TS_switch5_case_14
    end
    if ____TS_switch5 == 3 then
        goto ____TS_switch5_case_15
    end
    if ____TS_switch5 == 7 then
        goto ____TS_switch5_case_16
    end
    if ____TS_switch5 == 12 then
        goto ____TS_switch5_case_17
    end
    if ____TS_switch5 == 17 then
        goto ____TS_switch5_case_18
    end
    if ____TS_switch5 == 24 then
        goto ____TS_switch5_case_19
    end
    if ____TS_switch5 == 28 then
        goto ____TS_switch5_case_20
    end
    if ____TS_switch5 == 33 then
        goto ____TS_switch5_case_21
    end
    if ____TS_switch5 == 2 then
        goto ____TS_switch5_case_22
    end
    if ____TS_switch5 == 5 then
        goto ____TS_switch5_case_23
    end
    if ____TS_switch5 == 13 then
        goto ____TS_switch5_case_24
    end
    if ____TS_switch5 == 15 then
        goto ____TS_switch5_case_25
    end
    if ____TS_switch5 == 20 then
        goto ____TS_switch5_case_26
    end
    if ____TS_switch5 == 25 then
        goto ____TS_switch5_case_27
    end
    if ____TS_switch5 == 30 then
        goto ____TS_switch5_case_28
    end
    if ____TS_switch5 == 35 then
        goto ____TS_switch5_case_29
    end
    if ____TS_switch5 == 10 then
        goto ____TS_switch5_case_30
    end
    if ____TS_switch5 == 18 then
        goto ____TS_switch5_case_31
    end
    if ____TS_switch5 == 22 then
        goto ____TS_switch5_case_32
    end
    if ____TS_switch5 == 26 then
        goto ____TS_switch5_case_33
    end
    if ____TS_switch5 == 31 then
        goto ____TS_switch5_case_34
    end
    if ____TS_switch5 == 36 then
        goto ____TS_switch5_case_35
    end
    goto ____TS_switch5_case_default
    ::____TS_switch5_case_0::
    ::____TS_switch5_case_1::
    ::____TS_switch5_case_2::
    ::____TS_switch5_case_3::
    ::____TS_switch5_case_4::
    ::____TS_switch5_case_5::
    ::____TS_switch5_case_6::
    do
        return ARMOUR_TYPE.UNARMOURED
    end
    ::____TS_switch5_case_7::
    ::____TS_switch5_case_8::
    ::____TS_switch5_case_9::
    ::____TS_switch5_case_10::
    ::____TS_switch5_case_11::
    ::____TS_switch5_case_12::
    ::____TS_switch5_case_13::
    ::____TS_switch5_case_14::
    do
        return ARMOUR_TYPE.LIGHT
    end
    ::____TS_switch5_case_15::
    ::____TS_switch5_case_16::
    ::____TS_switch5_case_17::
    ::____TS_switch5_case_18::
    ::____TS_switch5_case_19::
    ::____TS_switch5_case_20::
    ::____TS_switch5_case_21::
    do
        return ARMOUR_TYPE.MEDIUM
    end
    ::____TS_switch5_case_22::
    ::____TS_switch5_case_23::
    ::____TS_switch5_case_24::
    ::____TS_switch5_case_25::
    ::____TS_switch5_case_26::
    ::____TS_switch5_case_27::
    ::____TS_switch5_case_28::
    ::____TS_switch5_case_29::
    do
        return ARMOUR_TYPE.HEAVY
    end
    ::____TS_switch5_case_30::
    ::____TS_switch5_case_31::
    ::____TS_switch5_case_32::
    ::____TS_switch5_case_33::
    ::____TS_switch5_case_34::
    do
        return ARMOUR_TYPE.FORTIFIED
    end
    ::____TS_switch5_case_35::
    do
        return ARMOUR_TYPE.HERO
    end
    ::____TS_switch5_case_default::
    do
        print("COULD NOT FIND ARMOUR TYPE FOR " .. tostring(self.wave) .. ":" .. tostring(self.id) .. ":" .. tostring(self.name))
        return ARMOUR_TYPE.UNARMOURED
    end
    ::____TS_switch5_end::
end
return ____exports
