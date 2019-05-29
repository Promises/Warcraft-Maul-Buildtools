library OrcPeon initializer Init

    //===========================================================================
    // Trigger: WorkersUnionOrcPeon
    //===========================================================================
    private function Trig_WorkersUnionOrcPeon_Conditions takes nothing returns boolean
        return GetUnitAbilityLevel(udg_DamageEventSource, 'A09Q') > 0
    endfunction

    private function Trig_WorkersUnionOrcPeon_Actions takes nothing returns nothing
        call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 1) + 1, 1)
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_WorkersUnionOrcPeon=CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_WorkersUnionOrcPeon, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_WorkersUnionOrcPeon, Condition(function Trig_WorkersUnionOrcPeon_Conditions))
        call TriggerAddAction(gg_trg_WorkersUnionOrcPeon, function Trig_WorkersUnionOrcPeon_Actions)
    endfunction

endlibrary