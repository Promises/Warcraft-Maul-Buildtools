library RockStacking initializer Init

    globals
        private trigger gg_trg_Rock_Stacking = null
    endglobals

private function Trig_Rock_Stacking_Conditions takes nothing returns boolean
    if ( not ( UnitHasItemOfTypeBJ(GetManipulatingUnit(), GetItemTypeId(GetManipulatedItem())) == true ) ) then
        return false
    endif
    if ( not ( GetManipulatedItem() != GetItemOfTypeFromUnitBJ(GetManipulatingUnit(), GetItemTypeId(GetManipulatedItem())) ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Rock_Stacking_Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I02F' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Rock_Stacking_Actions takes nothing returns nothing
    if ( Trig_Rock_Stacking_Func001C() ) then
        call SetItemCharges( GetItemOfTypeFromUnitBJ(GetManipulatingUnit(), GetItemTypeId(GetManipulatedItem())), ( GetItemCharges(GetItemOfTypeFromUnitBJ(GetManipulatingUnit(), GetItemTypeId(GetManipulatedItem()))) + GetItemCharges(GetManipulatedItem()) ) )
        call UnitRemoveItemSwapped( GetManipulatedItem(), GetManipulatingUnit() )
        call RemoveItem( GetManipulatedItem() )
    else
    endif
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    set gg_trg_Rock_Stacking = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Rock_Stacking, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_Rock_Stacking, Condition( function Trig_Rock_Stacking_Conditions ) )
    call TriggerAddAction( gg_trg_Rock_Stacking, function Trig_Rock_Stacking_Actions )
endfunction

endlibrary