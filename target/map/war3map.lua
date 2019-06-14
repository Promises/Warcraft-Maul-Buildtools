-- ceres header start

local ceres = {
}

local __ceres_hooks = {
    ["main::before"] = {},
    ["main::after"] = {},
    ["config::before"] = {},
    ["config::after"] = {}
}

local function __ceres_hookCall(hookName)
    for _, callback in pairs(__ceres_hooks[hookName]) do
        callback()
    end
end

local __ceres_customMain = nil
local __ceres_customConfig = nil

local function __ceresMain()
    __ceres_hookCall("main::before")
    if __ceres_customMain ~= nil then
        __ceres_customMain()
    else
        ceres.__oldMain()
    end
    __ceres_hookCall("main::after")
end

local function __ceresConfig()
    __ceres_hookCall("config::before")
    if __ceres_customConfig ~= nil then
        __ceres_customConfig()
    else
        ceres.__oldConfig()
    end
    __ceres_hookCall("config::after")
end

function ceres.addHook(hookName, callback)
    table.insert(__ceres_hooks[hookName], ceres.wrapCatch(callback))
end

function ceres.setMain(callback)
    __ceres_customMain = callback
end

function ceres.setConfig(callback)
    __ceres_customConfig = callback
end

function ceres.catch(callback, ...)
    local success, err = pcall(callback, ...)

    if not success then
        print(err)
    end
end

function ceres.wrapCatch(callback)
    return function(...)
        ceres.catch(callback, ...)
    end
end

local __modules = {}

require = function(name)
    local module = __modules[name]

    if module ~= nil then
        if module.initialized then
            return module.cached
        else
            module.initialized = true
            module.cached = module.loader()
            return module.cached
        end
    else
        error("module not found")
    end
end

-- ceres header end
gg_dest_B000_0160 = nil
function InitGlobals()
end

function InitUpgrades_Player0()
    SetPlayerTechResearched(Player(0), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Rows"), 1)
end

function InitUpgrades_Player1()
    SetPlayerTechResearched(Player(1), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Rows"), 1)
end

function InitUpgrades_Player2()
    SetPlayerTechResearched(Player(2), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Rows"), 1)
end

function InitUpgrades_Player3()
    SetPlayerTechResearched(Player(3), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Rows"), 1)
end

function InitUpgrades_Player4()
    SetPlayerTechResearched(Player(4), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Rows"), 1)
end

function InitUpgrades_Player5()
    SetPlayerTechResearched(Player(5), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Rows"), 1)
end

function InitUpgrades_Player6()
    SetPlayerTechResearched(Player(6), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Rows"), 1)
end

function InitUpgrades_Player7()
    SetPlayerTechResearched(Player(7), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Rows"), 1)
end

function InitUpgrades_Player8()
    SetPlayerTechResearched(Player(8), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Rows"), 1)
end

function InitUpgrades()
    InitUpgrades_Player0()
    InitUpgrades_Player1()
    InitUpgrades_Player2()
    InitUpgrades_Player3()
    InitUpgrades_Player4()
    InitUpgrades_Player5()
    InitUpgrades_Player6()
    InitUpgrades_Player7()
    InitUpgrades_Player8()
end

function InitTechTree_Player0()
    SetPlayerTechMaxAllowed(Player(0), FourCC("ostr"), 0)
    SetPlayerTechMaxAllowed(Player(0), FourCC("hC63"), 0)
end

function InitTechTree_Player1()
    SetPlayerTechMaxAllowed(Player(1), FourCC("ostr"), 0)
    SetPlayerTechMaxAllowed(Player(1), FourCC("hC63"), 0)
end

function InitTechTree_Player2()
    SetPlayerTechMaxAllowed(Player(2), FourCC("ostr"), 0)
    SetPlayerTechMaxAllowed(Player(2), FourCC("hC63"), 0)
end

function InitTechTree_Player3()
    SetPlayerTechMaxAllowed(Player(3), FourCC("ostr"), 0)
    SetPlayerTechMaxAllowed(Player(3), FourCC("hC63"), 0)
end

function InitTechTree_Player4()
    SetPlayerTechMaxAllowed(Player(4), FourCC("ostr"), 0)
    SetPlayerTechMaxAllowed(Player(4), FourCC("hC63"), 0)
end

function InitTechTree_Player5()
    SetPlayerTechMaxAllowed(Player(5), FourCC("ostr"), 0)
    SetPlayerTechMaxAllowed(Player(5), FourCC("hC63"), 0)
end

function InitTechTree_Player6()
    SetPlayerTechMaxAllowed(Player(6), FourCC("ostr"), 0)
end

function InitTechTree_Player7()
    SetPlayerTechMaxAllowed(Player(7), FourCC("ostr"), 0)
end

function InitTechTree_Player8()
    SetPlayerTechMaxAllowed(Player(8), FourCC("ostr"), 0)
end

function InitTechTree_Player11()
    SetPlayerTechMaxAllowed(Player(11), FourCC("ostr"), 0)
end

function InitTechTree()
    InitTechTree_Player0()
    InitTechTree_Player1()
    InitTechTree_Player2()
    InitTechTree_Player3()
    InitTechTree_Player4()
    InitTechTree_Player5()
    InitTechTree_Player6()
    InitTechTree_Player7()
    InitTechTree_Player8()
    InitTechTree_Player11()
end

function InitCustomPlayerSlots()
    SetPlayerStartLocation(Player(0), 0)
    ForcePlayerStartLocation(Player(0), 0)
    SetPlayerColor(Player(0), ConvertPlayerColor(0))
    SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(0), false)
    SetPlayerController(Player(0), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(1), 1)
    ForcePlayerStartLocation(Player(1), 1)
    SetPlayerColor(Player(1), ConvertPlayerColor(1))
    SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(1), false)
    SetPlayerController(Player(1), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(2), 2)
    ForcePlayerStartLocation(Player(2), 2)
    SetPlayerColor(Player(2), ConvertPlayerColor(2))
    SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(2), false)
    SetPlayerController(Player(2), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(3), 3)
    ForcePlayerStartLocation(Player(3), 3)
    SetPlayerColor(Player(3), ConvertPlayerColor(3))
    SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(3), false)
    SetPlayerController(Player(3), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(4), 4)
    ForcePlayerStartLocation(Player(4), 4)
    SetPlayerColor(Player(4), ConvertPlayerColor(4))
    SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(4), false)
    SetPlayerController(Player(4), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(5), 5)
    ForcePlayerStartLocation(Player(5), 5)
    SetPlayerColor(Player(5), ConvertPlayerColor(5))
    SetPlayerRacePreference(Player(5), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(5), false)
    SetPlayerController(Player(5), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(6), 6)
    ForcePlayerStartLocation(Player(6), 6)
    SetPlayerColor(Player(6), ConvertPlayerColor(6))
    SetPlayerRacePreference(Player(6), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(6), false)
    SetPlayerController(Player(6), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(7), 7)
    ForcePlayerStartLocation(Player(7), 7)
    SetPlayerColor(Player(7), ConvertPlayerColor(7))
    SetPlayerRacePreference(Player(7), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(7), false)
    SetPlayerController(Player(7), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(8), 8)
    ForcePlayerStartLocation(Player(8), 8)
    SetPlayerColor(Player(8), ConvertPlayerColor(8))
    SetPlayerRacePreference(Player(8), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(8), false)
    SetPlayerController(Player(8), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(9), 9)
    ForcePlayerStartLocation(Player(9), 9)
    SetPlayerColor(Player(9), ConvertPlayerColor(9))
    SetPlayerRacePreference(Player(9), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(9), false)
    SetPlayerController(Player(9), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(10), 10)
    ForcePlayerStartLocation(Player(10), 10)
    SetPlayerColor(Player(10), ConvertPlayerColor(10))
    SetPlayerRacePreference(Player(10), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(10), false)
    SetPlayerController(Player(10), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(11), 11)
    ForcePlayerStartLocation(Player(11), 11)
    SetPlayerColor(Player(11), ConvertPlayerColor(11))
    SetPlayerRacePreference(Player(11), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(11), false)
    SetPlayerController(Player(11), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(12), 12)
    ForcePlayerStartLocation(Player(12), 12)
    SetPlayerColor(Player(12), ConvertPlayerColor(12))
    SetPlayerRacePreference(Player(12), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(12), false)
    SetPlayerController(Player(12), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(13), 13)
    SetPlayerColor(Player(13), ConvertPlayerColor(13))
    SetPlayerRacePreference(Player(13), RACE_PREF_UNDEAD)
    SetPlayerRaceSelectable(Player(13), false)
    SetPlayerController(Player(13), MAP_CONTROL_COMPUTER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
    SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(1), 0)
    SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(2), 0)
    SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(3), 0)
    SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(4), 0)
    SetPlayerState(Player(4), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(5), 0)
    SetPlayerState(Player(5), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(6), 0)
    SetPlayerState(Player(6), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(7), 0)
    SetPlayerState(Player(7), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(8), 0)
    SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(9), 0)
    SetPlayerState(Player(9), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(10), 0)
    SetPlayerState(Player(10), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(11), 0)
    SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerTeam(Player(12), 0)
    SetPlayerState(Player(12), PLAYER_STATE_ALLIED_VICTORY, 1)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(11), true)
    SetPlayerTeam(Player(13), 1)
    SetPlayerState(Player(13), PLAYER_STATE_ALLIED_VICTORY, 1)
end

function InitAllyPriorities()
    SetStartLocPrioCount(0, 2)
    SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 1, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(1, 3)
    SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 2, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(2, 2)
    SetStartLocPrio(2, 0, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 1, 12, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(3, 3)
    SetStartLocPrio(3, 0, 7, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(3, 1, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 2, 12, MAP_LOC_PRIO_LOW)
    SetStartLocPrioCount(4, 6)
    SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(4, 3, 8, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(4, 4, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 5, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(5, 3)
    SetStartLocPrio(5, 0, 6, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(5, 1, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 2, 11, MAP_LOC_PRIO_LOW)
    SetStartLocPrioCount(6, 3)
    SetStartLocPrio(6, 0, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 1, 8, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(6, 2, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(7, 3)
    SetStartLocPrio(7, 0, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 1, 8, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(7, 2, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(8, 5)
    SetStartLocPrio(8, 0, 4, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(8, 1, 6, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(8, 2, 7, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(8, 3, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 4, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(9, 4)
    SetStartLocPrio(9, 0, 4, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(9, 1, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 2, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 3, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(10, 4)
    SetStartLocPrio(10, 0, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 1, 4, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(10, 2, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 3, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(11, 2)
    SetStartLocPrio(11, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 1, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(12, 2)
    SetStartLocPrio(12, 0, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(12, 1, 3, MAP_LOC_PRIO_HIGH)
end

function main()
    SetCameraBounds(-5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 5632.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 5632.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    SetWaterBaseColor(128, 128, 255, 255)
    NewSoundEnvironment("Default")
    SetAmbientDaySound("IceCrownDay")
    SetAmbientNightSound("IceCrownNight")
    SetMapMusic("Music", true, 0)
    InitUpgrades()
    InitTechTree()
    InitBlizzard()
    InitGlobals()
end

function config()
    SetMapName("TRIGSTR_6276")
    SetMapDescription("TRIGSTR_9414")
    SetPlayers(14)
    SetTeams(14)
    SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    DefineStartLocation(0, -2432.0, 4736.0)
    DefineStartLocation(1, 0.0, 4096.0)
    DefineStartLocation(2, 2432.0, 4736.0)
    DefineStartLocation(3, 4352.0, -512.0)
    DefineStartLocation(4, 0.0, 1024.0)
    DefineStartLocation(5, -4352.0, -512.0)
    DefineStartLocation(6, -3840.0, -3456.0)
    DefineStartLocation(7, 3840.0, -3456.0)
    DefineStartLocation(8, 0.0, -3072.0)
    DefineStartLocation(9, -2176.0, -1280.0)
    DefineStartLocation(10, 2176.0, -1280.0)
    DefineStartLocation(11, -4352.0, 2560.0)
    DefineStartLocation(12, 4352.0, 2560.0)
    DefineStartLocation(13, 0.0, -4736.0)
    InitCustomPlayerSlots()
    InitCustomTeams()
    InitAllyPriorities()
end


local function __module_0()
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
    
end
__modules["app.src.lib.translators"] = {initialized = false, cached = nil, loader = __module_0}
local function __module_1()
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
    
end
__modules["app.src.World.GlobalSettings"] = {initialized = false, cached = nil, loader = __module_1}
local function __module_2()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local __TSTL_GlobalSettings = require("app.src.World.GlobalSettings")
    local COLOUR_CODES = __TSTL_GlobalSettings.COLOUR_CODES
    ____exports.AbstractPlayer = {}
    local AbstractPlayer = ____exports.AbstractPlayer
    AbstractPlayer.name = "AbstractPlayer"
    AbstractPlayer.__index = AbstractPlayer
    AbstractPlayer.prototype = {}
    AbstractPlayer.prototype.__index = AbstractPlayer.prototype
    AbstractPlayer.prototype.constructor = AbstractPlayer
    function AbstractPlayer.new(...)
        local self = setmetatable({}, AbstractPlayer.prototype)
        self:____constructor(...)
        return self
    end
    function AbstractPlayer.prototype.____constructor(self, id)
        self.id = id
        self.wcPlayer = Player(id)
    end
    function AbstractPlayer.prototype.makeAlliance(self, otherPlayer)
        SetPlayerAllianceStateBJ(self.wcPlayer, otherPlayer.wcPlayer, bj_ALLIANCE_ALLIED_VISION)
    end
    function AbstractPlayer.prototype.getPlayerColour(self)
        return string.lower(COLOUR[self.id])
    end
    function AbstractPlayer.prototype.getColourCode(self)
        return COLOUR_CODES[self.id + 1]
    end
    function AbstractPlayer.prototype.getNameWithColour(self)
        return Util:ColourString(self:getColourCode(), self:getPlayerName())
    end
    function AbstractPlayer.prototype.getPlayerName(self)
        return GetPlayerName(self.wcPlayer)
    end
    function AbstractPlayer.prototype.sendMessage(self, message)
        DisplayTimedTextToPlayer(self.wcPlayer, 0, 0, 5, message)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Players.AbstractPlayer"] = {initialized = false, cached = nil, loader = __module_2}
local function __module_3()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local __TSTL_AbstractPlayer = require("app.src.World.Entity.Players.AbstractPlayer")
    local AbstractPlayer = __TSTL_AbstractPlayer.AbstractPlayer
    local __TSTL_GlobalSettings = require("app.src.World.GlobalSettings")
    local ALLOW_PLAYER_TOWER_LOCATIONS = __TSTL_GlobalSettings.ALLOW_PLAYER_TOWER_LOCATIONS
    ____exports.Defender = {}
    local Defender = ____exports.Defender
    Defender.name = "Defender"
    Defender.__index = Defender
    Defender.prototype = {}
    Defender.prototype.__index = Defender.prototype
    Defender.prototype.constructor = Defender
    Defender.____super = AbstractPlayer
    setmetatable(Defender, Defender.____super)
    setmetatable(Defender.prototype, Defender.____super.prototype)
    function Defender.new(...)
        local self = setmetatable({}, Defender.prototype)
        self:____constructor(...)
        return self
    end
    function Defender.prototype.____constructor(self, id)
        AbstractPlayer.prototype.____constructor(self, id)
        self:setUpPlayerVariables()
    end
    function Defender.prototype.setUpPlayerVariables(self)
        CreateFogModifierRectBJ(true, self.wcPlayer, FOG_OF_WAR_VISIBLE, GetPlayableMapRect())
        SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, self.id == COLOUR.GRAY and 150 or 100)
        SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, 1)
        self:sendMessage("Hello " .. tostring(self:getNameWithColour()) .. ", you are playing as " .. tostring(self:getPlayerColour()))
        local allowTowerLoc = ALLOW_PLAYER_TOWER_LOCATIONS[self.id + 1]
        self.allowPlayerTower = CreateUnit(self.wcPlayer, FourCC("h03S"), allowTowerLoc.x, allowTowerLoc.y, 0)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Players.Defender"] = {initialized = false, cached = nil, loader = __module_3}
local function __module_4()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local __TSTL_GlobalSettings = require("app.src.World.GlobalSettings")
    local players = __TSTL_GlobalSettings.players
    local __TSTL_AbstractPlayer = require("app.src.World.Entity.Players.AbstractPlayer")
    local AbstractPlayer = __TSTL_AbstractPlayer.AbstractPlayer
    ____exports.Attacker = {}
    local Attacker = ____exports.Attacker
    Attacker.name = "Attacker"
    Attacker.__index = Attacker
    Attacker.prototype = {}
    Attacker.prototype.__index = Attacker.prototype
    Attacker.prototype.constructor = Attacker
    Attacker.____super = AbstractPlayer
    setmetatable(Attacker, Attacker.____super)
    setmetatable(Attacker.prototype, Attacker.____super.prototype)
    function Attacker.new(...)
        local self = setmetatable({}, Attacker.prototype)
        self:____constructor(...)
        return self
    end
    function Attacker.prototype.____constructor(self, id)
        AbstractPlayer.prototype.____constructor(self, id)
        SetPlayerName(self.wcPlayer, "Forces of Darkness")
        SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, self.wcPlayer)
        for ____, humanPlayer in ipairs(players) do
            SetPlayerAllianceStateBJ(humanPlayer.wcPlayer, self.wcPlayer, bj_ALLIANCE_UNALLIED)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Players.Attacker"] = {initialized = false, cached = nil, loader = __module_4}
local function __module_5()
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
    
end
__modules["app.src.World.Entity.Ship"] = {initialized = false, cached = nil, loader = __module_5}
local function __module_6()
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
    
end
__modules["app.src.World.Entity.Creep"] = {initialized = false, cached = nil, loader = __module_6}
local function __module_7()
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
    
end
__modules["app.src.World.Game.Race"] = {initialized = false, cached = nil, loader = __module_7}
local function __module_8()
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
    ____exports.PlayerSpawns = {}
    local PlayerSpawns = ____exports.PlayerSpawns
    PlayerSpawns.name = "PlayerSpawns"
    PlayerSpawns.__index = PlayerSpawns
    PlayerSpawns.prototype = {}
    PlayerSpawns.prototype.____getters = {}
    PlayerSpawns.prototype.__index = __TS__Index(PlayerSpawns.prototype)
    PlayerSpawns.prototype.____setters = {}
    PlayerSpawns.prototype.__newindex = __TS__NewIndex(PlayerSpawns.prototype)
    PlayerSpawns.prototype.constructor = PlayerSpawns
    function PlayerSpawns.new(...)
        local self = setmetatable({}, PlayerSpawns.prototype)
        self:____constructor(...)
        return self
    end
    function PlayerSpawns.prototype.____constructor(self, worldMap)
        self.worldMap = worldMap
    end
    function PlayerSpawns.prototype.____getters.spawnOne(self)
        return self._spawnOne
    end
    function PlayerSpawns.prototype.____getters.spawnTwo(self)
        if self._spawnTwo == nil then
            return self.spawnOne
        end
        return self._spawnTwo
    end
    function PlayerSpawns.prototype.____setters.spawnOne(self, value)
        self._spawnOne = value
        if self.spawnOne then
            self.oneTrig = CreateTrigger()
            TriggerRegisterEnterRectSimple(self.oneTrig, self.spawnOne.rectangle)
            TriggerAddCondition(self.oneTrig, Condition(function() return self:EnteringUnitIsCreepAndHasNoCheckpoint() end))
            TriggerAddAction(self.oneTrig, function() return self:SpawnAction(self.spawnOne) end)
        end
    end
    function PlayerSpawns.prototype.____setters.spawnTwo(self, value)
        self._spawnTwo = value
        if self.spawnTwo then
            self.twoTrig = CreateTrigger()
            TriggerRegisterEnterRectSimple(self.twoTrig, self.spawnTwo.rectangle)
            TriggerAddCondition(self.twoTrig, Condition(function() return self:EnteringUnitIsCreepAndHasNoCheckpoint() end))
            TriggerAddAction(self.twoTrig, function() return self:SpawnAction(self.spawnTwo) end)
        end
    end
    function PlayerSpawns.prototype.EnteringUnitIsCreepAndHasNoCheckpoint(self)
        return true
    end
    function PlayerSpawns.prototype.isEnteringUnitCreep(self)
        local ownerID = GetPlayerId(GetOwningPlayer(GetEnteringUnit()))
        local ____TS_switch15 = ownerID
        if ____TS_switch15 == COLOUR.NAVY then
            goto ____TS_switch15_case_0
        end
        if ____TS_switch15 == COLOUR.TURQUOISE then
            goto ____TS_switch15_case_1
        end
        if ____TS_switch15 == COLOUR.VOILET then
            goto ____TS_switch15_case_2
        end
        if ____TS_switch15 == COLOUR.WHEAT then
            goto ____TS_switch15_case_3
        end
        goto ____TS_switch15_case_default
        ::____TS_switch15_case_0::
        ::____TS_switch15_case_1::
        ::____TS_switch15_case_2::
        ::____TS_switch15_case_3::
        do
            return true
        end
        ::____TS_switch15_case_default::
        do
            return false
        end
        ::____TS_switch15_end::
    end
    function PlayerSpawns.prototype.SpawnAction(self, spawn)
        if not spawn.next then
            return
        end
        IssuePointOrder(GetEnteringUnit(), "move", GetRectCenterX(spawn.next.rectangle), GetRectCenterY(spawn.next.rectangle))
        self:AddCreepAbilities()
    end
    function PlayerSpawns.prototype.AddCreepAbilities(self)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.PlayerSpawns"] = {initialized = false, cached = nil, loader = __module_8}
local function __module_9()
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
    
end
__modules["app.src.World.Entity.SpawnedCreep"] = {initialized = false, cached = nil, loader = __module_9}
local function __module_10()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    -- Lua Library inline imports
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____symbolMetatable = {__tostring = function(self)
        if self.description == nil then
            return "Symbol()"
        else
            return "Symbol(" .. tostring(self.description) .. ")"
        end
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, ____symbolMetatable)
    end
    Symbol = {
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag"),
    }
    
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    function __TS__InstanceOf(obj, classTbl)
        if (type(classTbl) == "table" and "object" or type(classTbl)) ~= "object" then
            error("Right-hand side of \'instanceof\' is not an object")
        end
        if classTbl[Symbol.hasInstance] ~= nil then
            return not not classTbl[Symbol.hasInstance](classTbl, obj)
        end
        if obj ~= nil then
            local luaClass = obj.constructor
            while luaClass ~= nil do
                if luaClass == classTbl then
                    return true
                end
                luaClass = luaClass.____super
            end
        end
        return false
    end
    
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    function __TS__Iterator(iterable)
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return function()
                local result = iterator:next()
                if not result.done then
                    return result.value
                else
                    return nil
                end
            end
        else
            local i = 0
            return function()
                i = i + 1
                return iterable[i]
            end
        end
    end
    
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    Map = (function()
        Map = {}
        Map.name = "Map"
        Map.__index = Map
        Map.prototype = {}
        Map.prototype.__index = Map.prototype
        Map.prototype.constructor = Map
        function Map.new(...)
            local self = setmetatable({}, Map.prototype)
            self:____constructor(...)
            return self
        end
        function Map.prototype.____constructor(self, entries)
            self[Symbol.toStringTag] = "Map"
            self.items = {}
            self.size = 0
            if entries == nil then
                return
            end
            local iterable = entries
            if iterable[Symbol.iterator] then
                local iterator = iterable[Symbol.iterator](iterable)
                while true do
                    local result = iterator:next()
                    if result.done then
                        break
                    end
                    local value = result.value
                    self:set(value[1], value[2])
                end
            else
                local array = entries
                self.size = #array
                for ____, kvp in ipairs(array) do
                    self.items[kvp[1]] = kvp[2]
                end
            end
        end
        function Map.prototype.clear(self)
            self.items = {}
            self.size = 0
            return
        end
        function Map.prototype.delete(self, key)
            local contains = self:has(key)
            if contains then
                self.size = self.size - 1
            end
            self.items[key] = nil
            return contains
        end
        function Map.prototype.forEach(self, callback)
            for key in pairs(self.items) do
                callback(_G, self.items[key], key, self)
            end
            return
        end
        function Map.prototype.get(self, key)
            return self.items[key]
        end
        function Map.prototype.has(self, key)
            return self.items[key] ~= nil
        end
        function Map.prototype.set(self, key, value)
            if not self:has(key) then
                self.size = self.size + 1
            end
            self.items[key] = value
            return self
        end
        Map.prototype[Symbol.iterator] = function(self)
            return self:entries()
        end
        function Map.prototype.entries(self)
            local items = self.items
            local key
            local value
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    key, value = next(items, key)
                    return {
                        done = not key,
                        value = {
                            key,
                            value,
                        },
                    }
                end,
            }
        end
        function Map.prototype.keys(self)
            local items = self.items
            local key
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    key = next(items, key)
                    return {
                        done = not key,
                        value = key,
                    }
                end,
            }
        end
        function Map.prototype.values(self)
            local items = self.items
            local key
            local value
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    key, value = next(items, key)
                    return {
                        done = not key,
                        value = value,
                    }
                end,
            }
        end
        Map[Symbol.species] = Map
        return Map
    end)()
    
    local ____exports = {}
    local __TSTL_SpawnedCreep = require("app.src.World.Entity.SpawnedCreep")
    local SpawnedCreep = __TSTL_SpawnedCreep.SpawnedCreep
    ____exports.SpawnedCreeps = {}
    local SpawnedCreeps = ____exports.SpawnedCreeps
    SpawnedCreeps.name = "SpawnedCreeps"
    SpawnedCreeps.__index = SpawnedCreeps
    SpawnedCreeps.prototype = {}
    SpawnedCreeps.prototype.__index = SpawnedCreeps.prototype
    SpawnedCreeps.prototype.constructor = SpawnedCreeps
    function SpawnedCreeps.new(...)
        local self = setmetatable({}, SpawnedCreeps.prototype)
        self:____constructor(...)
        return self
    end
    function SpawnedCreeps.prototype.____constructor(self)
        self.unitMap = Map.new()
        local creativeName = CreateUnit(Player(COLOUR.NAVY), FourCC("u000"), -64, 4032, 240)
        self.unitMap:set(GetHandleIdBJ(creativeName), SpawnedCreep.new(creativeName))
        local triggerTest = CreateTrigger()
        TriggerRegisterAnyUnitEventBJ(triggerTest, EVENT_PLAYER_UNIT_SELECTED)
        TriggerAddAction(triggerTest, function() return self:printUnit() end)
    end
    function SpawnedCreeps.prototype.printUnit(self)
        local test = self.unitMap:get(GetHandleIdBJ(GetTriggerUnit()))
        if test ~= nil then
            test:printId()
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.SpawnedCreeps"] = {initialized = false, cached = nil, loader = __module_10}
local function __module_11()
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
    
end
__modules["app.src.World.Entity.CheckPoint"] = {initialized = false, cached = nil, loader = __module_11}
local function __module_12()
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
    
end
__modules["app.src.World.Entity.Teleporter"] = {initialized = false, cached = nil, loader = __module_12}
local function __module_13()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    -- Lua Library inline imports
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____symbolMetatable = {__tostring = function(self)
        if self.description == nil then
            return "Symbol()"
        else
            return "Symbol(" .. tostring(self.description) .. ")"
        end
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, ____symbolMetatable)
    end
    Symbol = {
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag"),
    }
    
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    function __TS__InstanceOf(obj, classTbl)
        if (type(classTbl) == "table" and "object" or type(classTbl)) ~= "object" then
            error("Right-hand side of \'instanceof\' is not an object")
        end
        if classTbl[Symbol.hasInstance] ~= nil then
            return not not classTbl[Symbol.hasInstance](classTbl, obj)
        end
        if obj ~= nil then
            local luaClass = obj.constructor
            while luaClass ~= nil do
                if luaClass == classTbl then
                    return true
                end
                luaClass = luaClass.____super
            end
        end
        return false
    end
    
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    function __TS__Iterator(iterable)
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return function()
                local result = iterator:next()
                if not result.done then
                    return result.value
                else
                    return nil
                end
            end
        else
            local i = 0
            return function()
                i = i + 1
                return iterable[i]
            end
        end
    end
    
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    Map = (function()
        Map = {}
        Map.name = "Map"
        Map.__index = Map
        Map.prototype = {}
        Map.prototype.__index = Map.prototype
        Map.prototype.constructor = Map
        function Map.new(...)
            local self = setmetatable({}, Map.prototype)
            self:____constructor(...)
            return self
        end
        function Map.prototype.____constructor(self, entries)
            self[Symbol.toStringTag] = "Map"
            self.items = {}
            self.size = 0
            if entries == nil then
                return
            end
            local iterable = entries
            if iterable[Symbol.iterator] then
                local iterator = iterable[Symbol.iterator](iterable)
                while true do
                    local result = iterator:next()
                    if result.done then
                        break
                    end
                    local value = result.value
                    self:set(value[1], value[2])
                end
            else
                local array = entries
                self.size = #array
                for ____, kvp in ipairs(array) do
                    self.items[kvp[1]] = kvp[2]
                end
            end
        end
        function Map.prototype.clear(self)
            self.items = {}
            self.size = 0
            return
        end
        function Map.prototype.delete(self, key)
            local contains = self:has(key)
            if contains then
                self.size = self.size - 1
            end
            self.items[key] = nil
            return contains
        end
        function Map.prototype.forEach(self, callback)
            for key in pairs(self.items) do
                callback(_G, self.items[key], key, self)
            end
            return
        end
        function Map.prototype.get(self, key)
            return self.items[key]
        end
        function Map.prototype.has(self, key)
            return self.items[key] ~= nil
        end
        function Map.prototype.set(self, key, value)
            if not self:has(key) then
                self.size = self.size + 1
            end
            self.items[key] = value
            return self
        end
        Map.prototype[Symbol.iterator] = function(self)
            return self:entries()
        end
        function Map.prototype.entries(self)
            local items = self.items
            local key
            local value
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    key, value = next(items, key)
                    return {
                        done = not key,
                        value = {
                            key,
                            value,
                        },
                    }
                end,
            }
        end
        function Map.prototype.keys(self)
            local items = self.items
            local key
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    key = next(items, key)
                    return {
                        done = not key,
                        value = key,
                    }
                end,
            }
        end
        function Map.prototype.values(self)
            local items = self.items
            local key
            local value
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    key, value = next(items, key)
                    return {
                        done = not key,
                        value = value,
                    }
                end,
            }
        end
        Map[Symbol.species] = Map
        return Map
    end)()
    
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    function __TS__ArrayPush(arr, ...)
        local items = ({...})
        for ____, item in ipairs(items) do
            arr[#arr + 1] = item
        end
        return #arr
    end
    
    local ____exports = {}
    local __TSTL_Ship = require("app.src.World.Entity.Ship")
    local Ship = __TSTL_Ship.Ship
    local __TSTL_Creep = require("app.src.World.Entity.Creep")
    local Creep = __TSTL_Creep.Creep
    local __TSTL_Race = require("app.src.World.Game.Race")
    local Race = __TSTL_Race.Race
    local __TSTL_PlayerSpawns = require("app.src.World.Entity.PlayerSpawns")
    local PlayerSpawns = __TSTL_PlayerSpawns.PlayerSpawns
    local __TSTL_SpawnedCreeps = require("app.src.World.Entity.SpawnedCreeps")
    local SpawnedCreeps = __TSTL_SpawnedCreeps.SpawnedCreeps
    local __TSTL_CheckPoint = require("app.src.World.Entity.CheckPoint")
    local CheckPoint = __TSTL_CheckPoint.CheckPoint
    local __TSTL_Teleporter = require("app.src.World.Entity.Teleporter")
    local Teleporter = __TSTL_Teleporter.Teleporter
    ____exports.WorldMap = {}
    local WorldMap = ____exports.WorldMap
    WorldMap.name = "WorldMap"
    WorldMap.__index = WorldMap
    WorldMap.prototype = {}
    WorldMap.prototype.__index = WorldMap.prototype
    WorldMap.prototype.constructor = WorldMap
    function WorldMap.new(...)
        local self = setmetatable({}, WorldMap.prototype)
        self:____constructor(...)
        return self
    end
    function WorldMap.prototype.____constructor(self, game)
        self.worldCreatures = Map.new()
        self.creeps = {}
        self.races = {}
        self.playerSpawns = {}
        self.game = game
        self:setupWorldCreatures()
    end
    function WorldMap.prototype.setupWorldCreatures(self)
        self.ship = Ship.new(CreateUnit(Player(13), FourCC("n05G"), 63, -5343.5, 0))
        self:createCreepWaves()
        self:createDummyCreeps()
        self:setupRaces()
        self.spawnedCreeps = SpawnedCreeps.new()
        self:setupCheckpoint()
    end
    function WorldMap.prototype.createDummyCreeps(self)
        local dummyWaves = {}
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("u006"), 1664, 3072, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC04"), 1792, 3072, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("eC05"), 1920, 3072, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC16"), 2048, 3072, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC17"), 2176, 3072, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC29"), 1664, 2944, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("o01C"), 1792, 2944, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC30"), 1920, 2944, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("oC31"), 2048, 2944, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC33"), 2176, 2944, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("n008"), 1664, 2816, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("eC38"), 1792, 2816, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC39"), 1920, 2816, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC40"), 2048, 2816, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC41"), 2176, 2816, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC42"), 1664, 2688, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("uC43"), 1792, 2688, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC44"), 1920, 2688, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("uC45"), 2048, 2688, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("n004"), 2176, 2688, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC48"), 1664, 2560, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("oC47"), 1792, 2560, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC49"), 1920, 2560, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC50"), 2048, 2560, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC51"), 2176, 2560, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("nC69"), 1664, 2432, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("eC52"), 1792, 2432, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("oC70"), 1920, 2432, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC95"), 2048, 2432, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("uC71"), 2176, 2432, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("hC76"), 1664, 2304, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("h03Y"), 1792, 2304, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("h03Z"), 1920, 2304, 270))
        __TS__ArrayPush(dummyWaves, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("h040"), 2048, 2304, 270))
        for ____, wave in ipairs(dummyWaves) do
            SetUnitInvulnerable(wave, true)
            PauseUnit(wave, true)
        end
        self.archimondeDummy = CreateUnit(Player(COLOUR.NAVY), FourCC("u000"), 4868, -4964, 240)
        PauseUnitBJ(true, self.archimondeDummy)
    end
    function WorldMap.prototype.createCreepWaves(self)
        __TS__ArrayPush(self.creeps, Creep.new(1, "u006", "Wisp"))
        __TS__ArrayPush(self.creeps, Creep.new(2, "hC04", "Clockwerk"))
        __TS__ArrayPush(self.creeps, Creep.new(3, "eC05", "Acolyte"))
        __TS__ArrayPush(self.creeps, Creep.new(4, "hC16", "Militia"))
        __TS__ArrayPush(self.creeps, Creep.new(5, "nC17", "Wind Rider"))
        __TS__ArrayPush(self.creeps, Creep.new(6, "nC29", "Tauren Mystic"))
        __TS__ArrayPush(self.creeps, Creep.new(7, "o01C", "Grunt"))
        __TS__ArrayPush(self.creeps, Creep.new(8, "nC30", "Makrura Snapper"))
        __TS__ArrayPush(self.creeps, Creep.new(9, "oC31", "Mutant"))
        __TS__ArrayPush(self.creeps, Creep.new(10, "nC33", "Mini-Tank"))
        __TS__ArrayPush(self.creeps, Creep.new(11, "n008", "Enraged Yeti"))
        __TS__ArrayPush(self.creeps, Creep.new(12, "eC38", "Faceless Brute"))
        __TS__ArrayPush(self.creeps, Creep.new(13, "nC39", "Stampeding Reptile"))
        __TS__ArrayPush(self.creeps, Creep.new(14, "nC40", "Nymph"))
        __TS__ArrayPush(self.creeps, Creep.new(15, "nC41", "Matured Dragon"))
        __TS__ArrayPush(self.creeps, Creep.new(16, "nC42", "Merfolk Champion"))
        __TS__ArrayPush(self.creeps, Creep.new(17, "uC43", "Eternal Spirit"))
        __TS__ArrayPush(self.creeps, Creep.new(18, "hC44", "Granite Golem"))
        __TS__ArrayPush(self.creeps, Creep.new(19, "uC45", "Walking Corpse"))
        __TS__ArrayPush(self.creeps, Creep.new(20, "n004", "Adult Dragon"))
        __TS__ArrayPush(self.creeps, Creep.new(21, "hC48", "Bear"))
        __TS__ArrayPush(self.creeps, Creep.new(22, "oC47", "Heavy Tank"))
        __TS__ArrayPush(self.creeps, Creep.new(23, "nC49", "Big Game Hunter"))
        __TS__ArrayPush(self.creeps, Creep.new(24, "nC50", "Water Spirit"))
        __TS__ArrayPush(self.creeps, Creep.new(25, "nC51", "Ancient Dragon"))
        __TS__ArrayPush(self.creeps, Creep.new(26, "nC69", "Steel Golem"))
        __TS__ArrayPush(self.creeps, Creep.new(27, "eC52", "Demonic Minion"))
        __TS__ArrayPush(self.creeps, Creep.new(28, "oC70", "Fire Spirit"))
        __TS__ArrayPush(self.creeps, Creep.new(29, "hC95", "Demon Queen"))
        __TS__ArrayPush(self.creeps, Creep.new(30, "uC71", "Nether Dragon"))
        __TS__ArrayPush(self.creeps, Creep.new(31, "hC76", "Blood Golem"))
        __TS__ArrayPush(self.creeps, Creep.new(32, "h03Y", "Big Bad Ogre"))
        __TS__ArrayPush(self.creeps, Creep.new(33, "h03Z", "Snap Dragon"))
        __TS__ArrayPush(self.creeps, Creep.new(34, "h040", "Zergling"))
        __TS__ArrayPush(self.creeps, Creep.new(35, "uC72", "Archimonde"))
        __TS__ArrayPush(self.creeps, Creep.new(36, "hC79", "CRAB OF DEATH"))
    end
    function WorldMap.prototype.setupRaces(self)
        __TS__ArrayPush(self.races, Race.new("h03L", "Workers Union"))
        __TS__ArrayPush(self.races, Race.new("uC98", "Demon Portal"))
        __TS__ArrayPush(self.races, Race.new("oC22", "Undead Necropolis"))
        __TS__ArrayPush(self.races, Race.new("eC10", "Aviaries"))
        __TS__ArrayPush(self.races, Race.new("u002", "High Elf Barracks"))
        __TS__ArrayPush(self.races, Race.new("u001", "Outland"))
        __TS__ArrayPush(self.races, Race.new("hC07", "Human Town Hall"))
        __TS__ArrayPush(self.races, Race.new("nC03", "Orc Stronghold"))
        __TS__ArrayPush(self.races, Race.new("n03W", "High Elf Farm"))
        __TS__ArrayPush(self.races, Race.new("uC13", "Giants Hall"))
        __TS__ArrayPush(self.races, Race.new("e00A", "The Unique"))
        __TS__ArrayPush(self.races, Race.new("e007", "The Summons"))
        __TS__ArrayPush(self.races, Race.new("n00J", "Arachnid Hive"))
        __TS__ArrayPush(self.races, Race.new("o017", "Draenei Haven"))
        __TS__ArrayPush(self.races, Race.new("u00B", "Dragons"))
        __TS__ArrayPush(self.races, Race.new("e00F", "Night Elf Ancient"))
        __TS__ArrayPush(self.races, Race.new("e00W", "Elementalists"))
        __TS__ArrayPush(self.races, Race.new("e002", "Tavern"))
        __TS__ArrayPush(self.races, Race.new("e003", "Corrupted Night Elves"))
        __TS__ArrayPush(self.races, Race.new("e005", "Goblins"))
        __TS__ArrayPush(self.races, Race.new("n03M", "Heros Altar"))
        __TS__ArrayPush(self.races, Race.new("e00D", "Caerbannog"))
        __TS__ArrayPush(self.races, Race.new("n01V", "Critters UNITE"))
        __TS__ArrayPush(self.races, Race.new("n02A", "Gnoll Republic"))
        __TS__ArrayPush(self.races, Race.new("h02T", "Void Cult"))
        __TS__ArrayPush(self.races, Race.new("n02S", "Alliance of Blades"))
        __TS__ArrayPush(self.races, Race.new("n03C", "Cavernous Creatures"))
        __TS__ArrayPush(self.races, Race.new("n046", "Forest Troll Hut"))
        __TS__ArrayPush(self.races, Race.new("n014", "Ice Troll Hut"))
        __TS__ArrayPush(self.races, Race.new("n03W", "Dark Troll Hut"))
        __TS__ArrayPush(self.races, Race.new("n04I", "The Forsaken"))
        __TS__ArrayPush(self.races, Race.new("e00H", "Dwarven Mine"))
        __TS__ArrayPush(self.races, Race.new("e00G", "Galaxy"))
        __TS__ArrayPush(self.races, Race.new("u01B", "Shrine of Buffs"))
    end
    function WorldMap.prototype.setupCheckpoint(self)
        local RedSpawns = PlayerSpawns.new(self)
        RedSpawns.spawnOne = CheckPoint.new(Rect(-1792, 4736, -1472, 5056), self)
        RedSpawns.spawnTwo = CheckPoint.new(Rect(-1792, 4416, -1472, 4736), self)
        __TS__ArrayPush(self.playerSpawns, RedSpawns)
        local RedCheckpoint = RedSpawns.spawnOne
        RedCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(RedCheckpoint, "next", CheckPoint.new(Rect(-2464, 4704, -2400, 4768), self))
        RedCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(RedCheckpoint, "next", CheckPoint.new(Rect(-3616, 4704, -3552, 4768), self))
        RedCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(RedCheckpoint, "next", Teleporter.new(Rect(-4384, 4704, -4320, 4768), self, 270))
        RedCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(RedCheckpoint, "next", CheckPoint.new(Rect(-4384, 3392, -4320, 3456), self))
        local BlueSpawns = PlayerSpawns.new(self)
        BlueSpawns.spawnOne = CheckPoint.new(Rect(-320, 4768, 0, 5088), self)
        BlueSpawns.spawnTwo = CheckPoint.new(Rect(0, 4768, 320, 5088), self)
        __TS__ArrayPush(self.playerSpawns, BlueSpawns)
        local TealSpawns = PlayerSpawns.new(self)
        TealSpawns.spawnOne = CheckPoint.new(Rect(1472, 4768, 1792, 5088), self)
        TealSpawns.spawnTwo = CheckPoint.new(Rect(1472, 4448, 1792, 4768), self)
        __TS__ArrayPush(self.playerSpawns, TealSpawns)
        local PurpleSpawns = PlayerSpawns.new(self)
        PurpleSpawns.spawnOne = CheckPoint.new(Rect(4032, 128, 4352, 448), self)
        PurpleSpawns.spawnTwo = CheckPoint.new(Rect(4352, 128, 4672, 448), self)
        __TS__ArrayPush(self.playerSpawns, PurpleSpawns)
        local YellowSpawns = PlayerSpawns.new(self)
        YellowSpawns.spawnOne = CheckPoint.new(Rect(-320, 1664, 0, 1984), self)
        YellowSpawns.spawnTwo = CheckPoint.new(Rect(0, 1664, 320, 1984), self)
        __TS__ArrayPush(self.playerSpawns, YellowSpawns)
        local OrangeSpawns = PlayerSpawns.new(self)
        OrangeSpawns.spawnOne = CheckPoint.new(Rect(-4672, 128, -4352, 448), self)
        OrangeSpawns.spawnTwo = CheckPoint.new(Rect(-4352, 128, -4032, 448), self)
        __TS__ArrayPush(self.playerSpawns, OrangeSpawns)
        local OrangeCheckpoint = OrangeSpawns.spawnOne
        OrangeCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(OrangeCheckpoint, "next", CheckPoint.new(Rect(-4384, -544, -4320, -480), self))
        OrangeCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(OrangeCheckpoint, "next", CheckPoint.new(Rect(-4384, -1696, -4320, -1632), self))
        OrangeCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(OrangeCheckpoint, "next", Teleporter.new(Rect(-4384, -2464, -4320, -2400), self, 0))
        OrangeCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(OrangeCheckpoint, "next", CheckPoint.new(Rect(-4768, -3488, -4704, -3424), self))
        local GreenSpawns = PlayerSpawns.new(self)
        GreenSpawns.spawnOne = CheckPoint.new(Rect(-4800, -3456, -4480, -3136), self)
        GreenSpawns.spawnTwo = CheckPoint.new(Rect(-4800, -3776, -4480, -3456), self)
        __TS__ArrayPush(self.playerSpawns, GreenSpawns)
        local GreenCheckpoint = GreenSpawns.spawnOne
        GreenCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(GreenCheckpoint, "next", CheckPoint.new(Rect(-3872, -3488, -3808, -3424), self))
        GreenCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(GreenCheckpoint, "next", CheckPoint.new(Rect(-2720, -3488, -2656, -3424), self))
        GreenCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(GreenCheckpoint, "next", Teleporter.new(Rect(-1952, -3488, -1888, -3424), self, 270))
        local PinkSpawns = PlayerSpawns.new(self)
        PinkSpawns.spawnOne = CheckPoint.new(Rect(4480, -3456, 4800, -3136), self)
        PinkSpawns.spawnTwo = CheckPoint.new(Rect(4480, -3776, 4800, -3456), self)
        __TS__ArrayPush(self.playerSpawns, PinkSpawns)
        local GreysSpawns = PlayerSpawns.new(self)
        GreysSpawns.spawnOne = CheckPoint.new(Rect(-160, -2464, 160, -2144), self)
        __TS__ArrayPush(self.playerSpawns, GreysSpawns)
        local GreysCheckpoint = GreysSpawns.spawnOne
        GreysCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(GreysCheckpoint, "next", CheckPoint.new(Rect(-32, -3104, 32, -3040), self))
        GreysCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(GreysCheckpoint, "next", CheckPoint.new(Rect(-32, -4256, 32, -4192), self))
        GreysCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(GreysCheckpoint, "next", CheckPoint.new(Rect(-768, -4992, 768, -4800), self))
        local LightBlueSpawns = PlayerSpawns.new(self)
        LightBlueSpawns.spawnOne = CheckPoint.new(Rect(-2496, -2240, -2176, -1920), self)
        LightBlueSpawns.spawnTwo = CheckPoint.new(Rect(-2176, -2240, -1856, -1920), self)
        __TS__ArrayPush(self.playerSpawns, LightBlueSpawns)
        local DarkGreenSpawns = PlayerSpawns.new(self)
        DarkGreenSpawns.spawnOne = CheckPoint.new(Rect(1856, -2240, 2176, -1920), self)
        DarkGreenSpawns.spawnTwo = CheckPoint.new(Rect(2176, -2240, 2496, -1920), self)
        __TS__ArrayPush(self.playerSpawns, DarkGreenSpawns)
        local BrownSpawns = PlayerSpawns.new(self)
        BrownSpawns.spawnOne = CheckPoint.new(Rect(-4672, 3200, -4352, 3520), self)
        BrownSpawns.spawnTwo = CheckPoint.new(Rect(-4352, 3200, -4032, 3520), self)
        __TS__ArrayPush(self.playerSpawns, BrownSpawns)
        local BrownCheckpoint = BrownSpawns.spawnOne
        BrownCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(BrownCheckpoint, "next", CheckPoint.new(Rect(-4384, 2528, -4320, 2592), self))
        BrownCheckpoint = (function(o, i, v)
            o[i] = v
            return v
        end)(BrownCheckpoint, "next", CheckPoint.new(Rect(-4384, 1376, -4320, 1440), self))
        local MaroonsSpawns = PlayerSpawns.new(self)
        MaroonsSpawns.spawnOne = CheckPoint.new(Rect(4032, 3200, 4352, 3520), self)
        MaroonsSpawns.spawnTwo = CheckPoint.new(Rect(4352, 3200, 4672, 3520), self)
        __TS__ArrayPush(self.playerSpawns, MaroonsSpawns)
        RedCheckpoint.next = BrownSpawns.spawnOne.next
        BrownCheckpoint.next = OrangeSpawns.spawnOne.next
        OrangeCheckpoint.next = GreenSpawns.spawnOne.next
        GreenCheckpoint.next = GreysSpawns.spawnOne
    end
    return ____exports
    
end
__modules["app.src.World.WorldMap"] = {initialized = false, cached = nil, loader = __module_13}
local function __module_14()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    -- Lua Library inline imports
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    function __TS__ArrayPush(arr, ...)
        local items = ({...})
        for ____, item in ipairs(items) do
            arr[#arr + 1] = item
        end
        return #arr
    end
    
    local ____exports = {}
    local __TSTL_Defender = require("app.src.World.Entity.Players.Defender")
    local Defender = __TSTL_Defender.Defender
    local __TSTL_GlobalSettings = require("app.src.World.GlobalSettings")
    local enemies = __TSTL_GlobalSettings.enemies
    local InitializeStaticSounds = __TSTL_GlobalSettings.InitializeStaticSounds
    local players = __TSTL_GlobalSettings.players
    local __TSTL_Attacker = require("app.src.World.Entity.Players.Attacker")
    local Attacker = __TSTL_Attacker.Attacker
    local __TSTL_WorldMap = require("app.src.World.WorldMap")
    local WorldMap = __TSTL_WorldMap.WorldMap
    ____exports.WarcraftMaul = {}
    local WarcraftMaul = ____exports.WarcraftMaul
    WarcraftMaul.name = "WarcraftMaul"
    WarcraftMaul.__index = WarcraftMaul
    WarcraftMaul.prototype = {}
    WarcraftMaul.prototype.__index = WarcraftMaul.prototype
    WarcraftMaul.prototype.constructor = WarcraftMaul
    function WarcraftMaul.new(...)
        local self = setmetatable({}, WarcraftMaul.prototype)
        self:____constructor(...)
        return self
    end
    function WarcraftMaul.prototype.____constructor(self)
        self.debugMode = false
        self.waveTimer = 90
        self.stringtest = "Hello player " .. tostring(GetPlayerName(Player(0)))
        if GetPlayerName(Player(0)) == "WorldEdit" then
            self.debugMode = true
        end
        if self.debugMode then
            self.waveTimer = 30
        end
        do
            local i = 0
            while i < 24 do
                if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                    if GetPlayerController(Player(i)) == MAP_CONTROL_USER then
                        __TS__ArrayPush(players, Defender.new(i))
                    end
                end
                i = i + 1
            end
        end
        __TS__ArrayPush(enemies, Attacker.new(COLOUR.NAVY))
        __TS__ArrayPush(enemies, Attacker.new(COLOUR.TURQUOISE))
        __TS__ArrayPush(enemies, Attacker.new(COLOUR.VOILET))
        __TS__ArrayPush(enemies, Attacker.new(COLOUR.WHEAT))
        for ____, enemy in ipairs(enemies) do
            for ____, enemyAlly in ipairs(enemies) do
                enemy:makeAlliance(enemyAlly)
            end
        end
        InitializeStaticSounds(nil)
        self.worldMap = WorldMap.new(self)
        if self.debugMode then
            CreateUnit(Player(COLOUR.RED), FourCC("e00B"), 0, 0, bj_UNIT_FACING)
        end
    end
    return ____exports
    
end
__modules["app.src.World.WarcraftMaul"] = {initialized = false, cached = nil, loader = __module_14}
local function __module_15()
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
    
end
__modules["main"] = {initialized = false, cached = nil, loader = __module_15}

-- ceres post-script start

ceres.__oldMain = main
ceres.__oldConfig = config

function main()
    __ceresMain()
end

function config()
    __ceresConfig()
end

ceres.catch(require("main"))

-- ceres post-script end
