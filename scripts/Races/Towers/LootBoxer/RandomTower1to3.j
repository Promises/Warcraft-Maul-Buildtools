library RandomTower1to3 initializer Init

    globals
        private trigger gg_trg_Random_Tower_1_to_3 = null
    endglobals

private function Trig_Random_Tower_1_to_3_Func002Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] == 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func002Func003Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] <= 99 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func002Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] <= 95 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'u044' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func004Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] <= 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func004Func003Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] <= 96 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func004Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] <= 90 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func004C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'u045' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func006Func003Func003Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] <= 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func006Func003Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] <= 95 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func006Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] <= 85 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Func006C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == 'u047' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Tower_1_to_3_Actions takes nothing returns nothing
    // Tier 1 Towers
    if ( Trig_Random_Tower_1_to_3_Func002C() ) then
        call ReplaceUnitBJ(GetConstructedStructure(), udg_TierOneTowers[GetRandomInt(0, udg_TierOneSize)], bj_UNIT_STATE_METHOD_DEFAULTS)
        set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] = GetRandomInt(1, 100)
        if ( Trig_Random_Tower_1_to_3_Func002Func003C() ) then
            call UnitAddItemByIdSwapped( 'I02F', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] )
        else
            if ( Trig_Random_Tower_1_to_3_Func002Func003Func002C() ) then
                call UnitAddItemByIdSwapped( 'I029', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] )
            else
                if ( Trig_Random_Tower_1_to_3_Func002Func003Func002Func002C() ) then
                    call UnitAddItemByIdSwapped( 'I02B', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] )
                else
                endif
            endif
        endif
    else
    endif
    // Tier 2 Towers
    if ( Trig_Random_Tower_1_to_3_Func004C() ) then
        call ReplaceUnitBJ(GetConstructedStructure(), udg_TierTwoTowers[GetRandomInt(0, udg_TierTwoSize)], bj_UNIT_STATE_METHOD_DEFAULTS)
        set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] = GetRandomInt(1, 100)
        if ( Trig_Random_Tower_1_to_3_Func004Func003C() ) then
            call UnitAddItemByIdSwapped( 'I02F', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] )
        else
            if ( Trig_Random_Tower_1_to_3_Func004Func003Func002C() ) then
                call UnitAddItemByIdSwapped( 'I029', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] )
            else
                if ( Trig_Random_Tower_1_to_3_Func004Func003Func002Func002C() ) then
                    call UnitAddItemByIdSwapped( 'I02B', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] )
                else
                endif
            endif
        endif
    else
    endif
    // Tier 3 Towers
    if ( Trig_Random_Tower_1_to_3_Func006C() ) then
        call ReplaceUnitBJ(GetConstructedStructure(), udg_TierThreeTowers[GetRandomInt(0, udg_TierThreeSize)], bj_UNIT_STATE_METHOD_DEFAULTS)
        set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] = GetRandomInt(1, 100)
        if ( Trig_Random_Tower_1_to_3_Func006Func003C() ) then
            call UnitAddItemByIdSwapped( 'I02F', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] )
            call SetItemCharges( GetLastCreatedItem(), GetRandomInt(1, 2) )
        else
            if ( Trig_Random_Tower_1_to_3_Func006Func003Func003C() ) then
                call UnitAddItemByIdSwapped( 'I029', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] )
            else
                if ( Trig_Random_Tower_1_to_3_Func006Func003Func003Func002C() ) then
                    call UnitAddItemByIdSwapped( 'I02B', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetConstructedStructure()))] )
                else
                endif
            endif
        endif
    else
    endif
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    set gg_trg_Random_Tower_1_to_3 = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Random_Tower_1_to_3, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
    call TriggerAddAction( gg_trg_Random_Tower_1_to_3, function Trig_Random_Tower_1_to_3_Actions )
endfunction

endlibrary

