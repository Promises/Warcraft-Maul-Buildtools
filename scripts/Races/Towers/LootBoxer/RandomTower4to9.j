library RandomTower4to9 initializer Init requires Construction

    globals
        private trigger gg_trg_Random_Towers_4_to_9 = null
    endglobals

private function Trig_Random_Towers_4_to_9_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0EX' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func002Func003Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func002Func003Func003Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 98 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func002Func003Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 90 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func002Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 80 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'u046' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func004Func003Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func004Func003Func003Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 95 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func004Func003Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 85 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func004Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 70 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func004C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'u048' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func006Func003Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func006Func003Func003Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 95 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func006Func003Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 80 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func006Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 60 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func006C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'u049' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func008Func003Func003Func002Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func008Func003Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 95 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func008Func003Func003Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 85 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func008Func003Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 70 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func008Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 50 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func008C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'u04A' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func010Func003Func003Func002Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func010Func003Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 92 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func010Func003Func003Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 80 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func010Func003Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 65 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func010Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 40 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func010C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'u04B' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func012Func003Func003Func002Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 100 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func012Func003Func003Func002Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 90 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func012Func003Func003Func002C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 80 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func012Func003Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 60 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func012Func003C takes nothing returns boolean
    if ( not ( udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] <= 30 ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Func012C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'u04C' ) ) then
        return false
    endif
    return true
endfunction

private function Trig_Random_Towers_4_to_9_Actions takes nothing returns nothing
    // Tier 4 Towers
    if ( Trig_Random_Towers_4_to_9_Func002C() ) then
        call Construction_setupTowerTriggers(ReplaceUnitBJ(GetSpellAbilityUnit(), udg_TierFourTowers[GetRandomInt(0, udg_TierFourSize)], bj_UNIT_STATE_METHOD_DEFAULTS))
        set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = GetRandomInt(1, 100)
        // if ( Trig_Random_Towers_4_to_9_Func002Func003C() ) then
        //     call UnitAddItemByIdSwapped( 'I02F', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     call SetItemCharges( GetLastCreatedItem(), GetRandomInt(1, 3) )
        // else
        //     if ( Trig_Random_Towers_4_to_9_Func002Func003Func003C() ) then
        //         call UnitAddItemByIdSwapped( 'I029', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     else
        //         if ( Trig_Random_Towers_4_to_9_Func002Func003Func003Func002C() ) then
        //             call UnitAddItemByIdSwapped( 'I02B', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //         else
        //             if ( Trig_Random_Towers_4_to_9_Func002Func003Func003Func002Func002C() ) then
        //                 call UnitAddItemByIdSwapped( 'I028', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //             else
        //             endif
        //         endif
        //     endif
        // endif
    else
    endif
    // Tier 5 Towers
    if ( Trig_Random_Towers_4_to_9_Func004C() ) then
        call Construction_setupTowerTriggers(ReplaceUnitBJ(GetSpellAbilityUnit(), udg_TierFiveTowers[GetRandomInt(0, udg_TierFiveSize)], bj_UNIT_STATE_METHOD_DEFAULTS))
        set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = GetRandomInt(1, 100)
        // if ( Trig_Random_Towers_4_to_9_Func004Func003C() ) then
        //     call UnitAddItemByIdSwapped( 'I02F', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     call SetItemCharges( GetLastCreatedItem(), GetRandomInt(1, 4) )
        // else
        //     if ( Trig_Random_Towers_4_to_9_Func004Func003Func003C() ) then
        //         call UnitAddItemByIdSwapped( 'I029', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     else
        //         if ( Trig_Random_Towers_4_to_9_Func004Func003Func003Func002C() ) then
        //             call UnitAddItemByIdSwapped( 'I02B', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //         else
        //             if ( Trig_Random_Towers_4_to_9_Func004Func003Func003Func002Func002C() ) then
        //                 call UnitAddItemByIdSwapped( 'I028', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //             else
        //             endif
        //         endif
        //     endif
        // endif
    else
    endif
    // Tier 6 Towers
    if ( Trig_Random_Towers_4_to_9_Func006C() ) then
        call Construction_setupTowerTriggers(ReplaceUnitBJ(GetSpellAbilityUnit(), udg_TierSixTowers[GetRandomInt(0, udg_TierSixSize)], bj_UNIT_STATE_METHOD_DEFAULTS))
        set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = GetRandomInt(1, 100)
        // if ( Trig_Random_Towers_4_to_9_Func006Func003C() ) then
        //     call UnitAddItemByIdSwapped( 'I02F', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     call SetItemCharges( GetLastCreatedItem(), GetRandomInt(1, 5) )
        // else
        //     if ( Trig_Random_Towers_4_to_9_Func006Func003Func003C() ) then
        //         call UnitAddItemByIdSwapped( 'I02B', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     else
        //         if ( Trig_Random_Towers_4_to_9_Func006Func003Func003Func002C() ) then
        //             call UnitAddItemByIdSwapped( 'I028', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //         else
        //             if ( Trig_Random_Towers_4_to_9_Func006Func003Func003Func002Func002C() ) then
        //                 call UnitAddItemByIdSwapped( 'I02A', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //             else
        //             endif
        //         endif
        //     endif
        // endif
    else
    endif
    // Tier 7 Towers
    if ( Trig_Random_Towers_4_to_9_Func008C() ) then
        call Construction_setupTowerTriggers(ReplaceUnitBJ(GetSpellAbilityUnit(), udg_TierSevenTowers[GetRandomInt(0, udg_TierSevenSize)], bj_UNIT_STATE_METHOD_DEFAULTS))
        set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = GetRandomInt(1, 100)
        // if ( Trig_Random_Towers_4_to_9_Func008Func003C() ) then
        //     call UnitAddItemByIdSwapped( 'I02F', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     call SetItemCharges( GetLastCreatedItem(), GetRandomInt(2, 6) )
        // else
        //     if ( Trig_Random_Towers_4_to_9_Func008Func003Func003C() ) then
        //         call UnitAddItemByIdSwapped( 'I028', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     else
        //         if ( Trig_Random_Towers_4_to_9_Func008Func003Func003Func002C() ) then
        //             call UnitAddItemByIdSwapped( 'I02B', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //         else
        //             if ( Trig_Random_Towers_4_to_9_Func008Func003Func003Func002Func002C() ) then
        //                 call UnitAddItemByIdSwapped( 'I02A', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //             else
        //                 if ( Trig_Random_Towers_4_to_9_Func008Func003Func003Func002Func002Func002C() ) then
        //                     call UnitAddItemByIdSwapped( 'I02C', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //                 else
        //                 endif
        //             endif
        //         endif
        //     endif
        // endif
    else
    endif
    // Tier 8 Towers
    if ( Trig_Random_Towers_4_to_9_Func010C() ) then
        call Construction_setupTowerTriggers(ReplaceUnitBJ(GetSpellAbilityUnit(), udg_TierEightTowers[GetRandomInt(0, udg_TierEightSize)], bj_UNIT_STATE_METHOD_DEFAULTS))
        set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = GetRandomInt(1, 100)
        // if ( Trig_Random_Towers_4_to_9_Func010Func003C() ) then
        //     call UnitAddItemByIdSwapped( 'I02F', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     call SetItemCharges( GetLastCreatedItem(), GetRandomInt(3, 7) )
        // else
        //     if ( Trig_Random_Towers_4_to_9_Func010Func003Func003C() ) then
        //         call UnitAddItemByIdSwapped( 'I028', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     else
        //         if ( Trig_Random_Towers_4_to_9_Func010Func003Func003Func002C() ) then
        //             call UnitAddItemByIdSwapped( 'I02A', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //         else
        //             if ( Trig_Random_Towers_4_to_9_Func010Func003Func003Func002Func002C() ) then
        //                 call UnitAddItemByIdSwapped( 'I02B', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //             else
        //                 if ( Trig_Random_Towers_4_to_9_Func010Func003Func003Func002Func002Func002C() ) then
        //                     call UnitAddItemByIdSwapped( 'I02C', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //                 else
        //                 endif
        //             endif
        //         endif
        //     endif
        // endif
    else
    endif
    // Tier 9 Towers
    if ( Trig_Random_Towers_4_to_9_Func012C() ) then
        call Construction_setupTowerTriggers(ReplaceUnitBJ(GetSpellAbilityUnit(), udg_TierNineTowers[GetRandomInt(0, udg_TierNineSize)], bj_UNIT_STATE_METHOD_DEFAULTS))
        set udg_LootBoxChance[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] = GetRandomInt(1, 100)
        // if ( Trig_Random_Towers_4_to_9_Func012Func003C() ) then
        //     call UnitAddItemByIdSwapped( 'I02F', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     call SetItemCharges( GetLastCreatedItem(), GetRandomInt(4, 8) )
        // else
        //     if ( Trig_Random_Towers_4_to_9_Func012Func003Func003C() ) then
        //         call UnitAddItemByIdSwapped( 'I028', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //     else
        //         if ( Trig_Random_Towers_4_to_9_Func012Func003Func003Func002C() ) then
        //             call UnitAddItemByIdSwapped( 'I02A', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //         else
        //             if ( Trig_Random_Towers_4_to_9_Func012Func003Func003Func002Func002C() ) then
        //                 call UnitAddItemByIdSwapped( 'I02B', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //             else
        //                 if ( Trig_Random_Towers_4_to_9_Func012Func003Func003Func002Func002Func002C() ) then
        //                     call UnitAddItemByIdSwapped( 'I02C', udg_LootBoxerUnit[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))] )
        //                 else
        //                 endif
        //             endif
        //         endif
        //     endif
        // endif
    else
    endif
endfunction

//===========================================================================
private function Init takes nothing returns nothing
    set gg_trg_Random_Towers_4_to_9 = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Random_Towers_4_to_9, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Random_Towers_4_to_9, Condition( function Trig_Random_Towers_4_to_9_Conditions ) )
    call TriggerAddAction( gg_trg_Random_Towers_4_to_9, function Trig_Random_Towers_4_to_9_Actions )
endfunction

endlibrary