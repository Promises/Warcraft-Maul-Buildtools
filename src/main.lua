--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("app.src.lib.translators")
require("app.src.World.GlobalSettings")
local __TSTL_WarcraftMaul = require("app.src.World.WarcraftMaul")
local WarcraftMaul = __TSTL_WarcraftMaul.WarcraftMaul
local __TSTL_GlobalSettings = require("app.src.World.GlobalSettings")
local COLOUR_CODES = __TSTL_GlobalSettings.COLOUR_CODES
function printError(self, err)
    print(tostring(Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "ERROR: ")) .. tostring(err))
end
function Main()
    local maul = WarcraftMaul.new()
    print("Initialisation finished")
end
local init = CreateTrigger()
TriggerRegisterTimerEvent(init, 0, false)
TriggerAddAction(init, function()
    xpcall(function() return Main() end, function(err) return printError(nil, err) end)
end)
