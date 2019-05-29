library NagaSlave initializer Init

    //===========================================================================
    // Trigger: WorkersUnionNagaSlave
    //===========================================================================
    private function Trig_WorkersUnionNagaSlave_Conditions takes nothing returns boolean
        return GetUnitAbilityLevel(udg_DamageEventSource, 'A09U') > 0
    endfunction

    private function Trig_WorkersUnionNagaSlave_Actions takes nothing returns nothing
        call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 1) + 20, 1)

        set udg_WorkerSlaveSpell=GetRandomInt(1, 4)
        if ( udg_WorkerSlaveSpell == 1 ) then
                set udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))]=GetUnitLoc(udg_DamageEventSource)
                call CreateNUnitsAtLoc(1, 'u008', GetOwningPlayer(udg_DamageEventSource), udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))], bj_UNIT_FACING)
                call UnitApplyTimedLifeBJ(3.00, 'BTLF', GetLastCreatedUnit())
                call UnitAddAbilityBJ('A09W', GetLastCreatedUnit())
                call IssueTargetOrderBJ(GetLastCreatedUnit(), "thunderbolt", udg_DamageEventTarget)
                call RemoveLocation(udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))])
            elseif ( udg_WorkerSlaveSpell == 2 ) then
                set udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))]=GetUnitLoc(udg_DamageEventSource)
                call CreateNUnitsAtLoc(1, 'u008', GetOwningPlayer(udg_DamageEventSource), udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))], bj_UNIT_FACING)
                call UnitApplyTimedLifeBJ(3.00, 'BTLF', GetLastCreatedUnit())
                call UnitAddAbilityBJ('A09X', GetLastCreatedUnit())
                call IssueTargetOrderBJ(GetLastCreatedUnit(), "forkedlightning", udg_DamageEventTarget)
                call RemoveLocation(udg_SpellPoint[GetConvertedPlayerId(GetOwningPlayer(udg_DamageEventSource))])
            endif
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_WorkersUnionNagaSlave=CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_WorkersUnionNagaSlave, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_WorkersUnionNagaSlave, Condition(function Trig_WorkersUnionNagaSlave_Conditions))
        call TriggerAddAction(gg_trg_WorkersUnionNagaSlave, function Trig_WorkersUnionNagaSlave_Actions)
    endfunction
endlibrary