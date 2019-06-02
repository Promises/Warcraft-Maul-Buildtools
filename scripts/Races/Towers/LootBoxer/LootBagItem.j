library LootBagItem initializer Init

    globals
        private trigger gg_trg_Loot_Bag_Item = null
    endglobals

private function Trig_Loot_Bag_Item_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I02B' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Loot_Bag_Item_1 takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] <= 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Loot_Bag_Item_2 takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] <= 95 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Loot_Bag_Item_3 takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] <= 80 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Loot_Bag_Item_4 takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] <= 40 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Loot_Bag_Item_Actions takes nothing returns nothing
    set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] = GetRandomInt(1, 100)
    if ( Trig_Loot_Bag_Item_4() ) then
        call UnitAddItemByIdSwapped( 'I029', GetTriggerUnit() )
    else
        if ( Trig_Loot_Bag_Item_3() ) then
            call UnitAddItemByIdSwapped( 'I02F', GetTriggerUnit() )
        else
            if ( Trig_Loot_Bag_Item_2() ) then
                call UnitAddItemByIdSwapped( 'I028', GetTriggerUnit() )
            else
                if ( Trig_Loot_Bag_Item_1() ) then
                    call UnitAddItemByIdSwapped( 'I02A', GetTriggerUnit() )
                else
                endif
            endif
        endif
    endif
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    set gg_trg_Loot_Bag_Item = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Loot_Bag_Item, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddCondition( gg_trg_Loot_Bag_Item, Condition( function Trig_Loot_Bag_Item_Conditions ) )
    call TriggerAddAction( gg_trg_Loot_Bag_Item, function Trig_Loot_Bag_Item_Actions )
endfunction

endlibrary