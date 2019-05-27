library DropItems initializer Init

    globals
        private trigger gg_trg_Drop_Items = null
    endglobals

private function Trig_Drop_Items_Func001Func002Func001C takes nothing returns boolean
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I02B' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I029' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I02A' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I02C' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I02F' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I028' ) ) then
        return true
    endif
    return false
endfunction

private function Trig_Drop_Items_Func001Func002Func002C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetManipulatingUnit()) != 'u046' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) != 'u048' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) != 'u049' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) != 'u04A' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) != 'u04B' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) != 'u04C' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetManipulatingUnit()) != 'u043' ) ) then
        return true
    endif
    return false
endfunction

private function Trig_Drop_Items_Func001Func002C takes nothing returns boolean
    if ( not Trig_Drop_Items_Func001Func002Func001C() ) then
        return false
    endif
    if ( not Trig_Drop_Items_Func001Func002Func002C() ) then
        return false
    endif
    return true
endfunction

private function Trig_Drop_Items_Func001C takes nothing returns boolean
    if ( not Trig_Drop_Items_Func001Func002C() ) then
        return false
    endif
    return true
endfunction

private function Trig_Drop_Items_Actions takes nothing returns nothing
    if ( Trig_Drop_Items_Func001C() ) then
        call UnitRemoveItemSwapped( GetManipulatedItem(), GetManipulatingUnit() )
    else
    endif
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    set gg_trg_Drop_Items = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Drop_Items, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddAction( gg_trg_Drop_Items, function Trig_Drop_Items_Actions )
endfunction

endlibrary