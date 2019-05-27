library DropItems initializer Init

    globals
        private trigger gg_trg_Drop_Items = null
    endglobals

private function Trig_Drop_Items_Func001Func002C takes nothing returns boolean
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
    if ( ( GetUnitTypeId(GetManipulatingUnit()) == 'u043' ) ) then
        return true
    endif
    return false
endfunction

private function Trig_Drop_Items_Func001C takes nothing returns boolean
    if ( not Trig_Drop_Items_Func001Func002C() ) then
        return false
    endif
    return true
endfunction

private function Trig_Drop_Items_Actions takes nothing returns nothing
    if ( Trig_Drop_Items_Func001C() ) then
    else
        call UnitRemoveItemSwapped( GetManipulatedItem(), GetManipulatingUnit() )
    endif
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    set gg_trg_Drop_Items = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Drop_Items, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddAction( gg_trg_Drop_Items, function Trig_Drop_Items_Actions )
endfunction

endlibrary