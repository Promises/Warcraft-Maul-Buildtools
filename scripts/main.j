//! inject main

    //! dovjassinit



    call InitCustomTriggers()
//! endinject


//===========================================================================
// Trigger: Start Extras
//===========================================================================

function InitCustomImportedTriggers takes nothing returns nothing
    call TestLib_Init()
    call InitTrig_Quests()
endfunction
