library RockConverting initializer Init

    globals
        private trigger gg_trg_Rock_Converting = null
    endglobals

private function Trig_Rock_Converting_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I02F' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Rock_Converting_Func001C takes nothing returns boolean
    if ( not ( GetItemCharges(GetManipulatedItem()) <= 8 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Rock_Converting_Actions takes nothing returns nothing
    if ( Trig_Rock_Converting_Func001C() ) then
        call SetItemCharges( GetManipulatedItem(), ( GetItemCharges(GetManipulatedItem()) + 1 ) )
    else
        call SetItemCharges( GetManipulatedItem(), ( GetItemCharges(GetManipulatedItem()) - 9 ) )
        call UnitAddItemByIdSwapped( 'I02B', GetManipulatingUnit() )
    endif
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    set gg_trg_Rock_Converting = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Rock_Converting, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddCondition( gg_trg_Rock_Converting, Condition( function Trig_Rock_Converting_Conditions ) )
    call TriggerAddAction( gg_trg_Rock_Converting, function Trig_Rock_Converting_Actions )
endfunction

endlibrary