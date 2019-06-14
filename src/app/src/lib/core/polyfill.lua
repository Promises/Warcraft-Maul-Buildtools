--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
function FourCC(input)
    return ({string.unpack(">I4", input)})
end
