//! inject main
    call SetCameraBounds(- 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 5632.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 5632.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call SetWaterBaseColor(128, 128, 255, 255)
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("IceCrownDay")
    call SetAmbientNightSound("IceCrownNight")
    call SetMapMusic("Music", true, 0)
    call InitUpgrades()
    call InitTechTree()
    call CreateAllDestructables()
    call CreateAllUnits()
    call InitBlizzard()

    //! dovjassinit

    call InitGlobals()

    call InitCustomImportedTriggers()

    call InitCustomTriggers()
    call RunInitializationTriggers()
//! endinject


//===========================================================================
// Trigger: Start Extras
//===========================================================================

function InitCustomImportedTriggers takes nothing returns nothing
    call TestLib_Init()
    call InitTrig_Quests()
endfunction