library OpenLootboxSetLevel initializer Init

    globals
        private trigger gg_trg_Open_Lootbox_Set_Level = null
    endglobals

private function Trig_Open_Lootbox_Set_Level_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'u046' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Open_Lootbox_Set_Level_Func004C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'u048' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Open_Lootbox_Set_Level_Func006C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'u049' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Open_Lootbox_Set_Level_Func008C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'u04A' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Open_Lootbox_Set_Level_Func010C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'u04B' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Open_Lootbox_Set_Level_Func012C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'u04C' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Open_Lootbox_Set_Level_Actions takes nothing returns nothing
    // Tier 4
    if ( Trig_Open_Lootbox_Set_Level_Func002C() ) then
        call SetUnitAbilityLevelSwapped( 'A0EX', GetConstructedStructure(), 4 )
    else
    endif
    // Tier 5
    if ( Trig_Open_Lootbox_Set_Level_Func004C() ) then
        call SetUnitAbilityLevelSwapped( 'A0EX', GetConstructedStructure(), 5 )
    else
    endif
    // Tier 6
    if ( Trig_Open_Lootbox_Set_Level_Func006C() ) then
        call SetUnitAbilityLevelSwapped( 'A0EX', GetConstructedStructure(), 6 )
    else
    endif
    // Tier 7
    if ( Trig_Open_Lootbox_Set_Level_Func008C() ) then
        call SetUnitAbilityLevelSwapped( 'A0EX', GetConstructedStructure(), 7 )
    else
    endif
    // Tier 8
    if ( Trig_Open_Lootbox_Set_Level_Func010C() ) then
        call SetUnitAbilityLevelSwapped( 'A0EX', GetConstructedStructure(), 8 )
    else
    endif
    // Tier 9
    if ( Trig_Open_Lootbox_Set_Level_Func012C() ) then
        call SetUnitAbilityLevelSwapped( 'A0EX', GetConstructedStructure(), 9 )
    else
    endif
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    set gg_trg_Open_Lootbox_Set_Level = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Open_Lootbox_Set_Level, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
    call TriggerAddAction( gg_trg_Open_Lootbox_Set_Level, function Trig_Open_Lootbox_Set_Level_Actions )
endfunction

endlibrary

