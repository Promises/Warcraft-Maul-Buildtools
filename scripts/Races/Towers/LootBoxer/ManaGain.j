library ManaGain initializer Init

    globals
        private trigger gg_trg_Mana_Gain = null
    endglobals

private function Trig_Mana_Gain_Func001Func001C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetManipulatingUnit()) == 'u046' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) == 'u048' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) == 'u049' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) == 'u04A' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) == 'u04B' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) == 'u04C' ) ) then
        return true
    endif
    return false
endfunction

private function Trig_Mana_Gain_Func001Func002C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I028' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Mana_Gain_Func001Func003C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I02A' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Mana_Gain_Func001Func004C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I02C' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Mana_Gain_Func001C takes nothing returns boolean
    if ( not Trig_Mana_Gain_Func001Func001C() ) then
        return false
    endif
    return true
endfunction

private function Trig_Mana_Gain_Actions takes nothing returns nothing
    if ( Trig_Mana_Gain_Func001C() ) then
        if ( Trig_Mana_Gain_Func001Func002C() ) then
            call SetUnitManaBJ( GetManipulatingUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetManipulatingUnit()) + 1 ) )
        else
        endif
        if ( Trig_Mana_Gain_Func001Func003C() ) then
            call SetUnitManaBJ( GetManipulatingUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetManipulatingUnit()) + 2.00 ) )
        else
        endif
        if ( Trig_Mana_Gain_Func001Func004C() ) then
            call SetUnitManaBJ( GetManipulatingUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetManipulatingUnit()) + 6.00 ) )
        else
        endif
    else
    endif
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    set gg_trg_Mana_Gain = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Mana_Gain, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddAction( gg_trg_Mana_Gain, function Trig_Mana_Gain_Actions )
endfunction

endlibrary