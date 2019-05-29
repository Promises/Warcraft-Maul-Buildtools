library HumanPeasant initializer Init

    //===========================================================================
    // Trigger: WorkersUnionHumanPeasant
    //===========================================================================
    private function Trig_WorkersUnionHumanPeasant_Conditions takes nothing returns boolean
        return GetUnitAbilityLevel(udg_DamageEventSource, 'A09T') > 0
    endfunction

    private function Trig_WorkersUnionHumanPeasant_Actions takes nothing returns nothing
        call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 1) + 2, 1)
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_WorkersUnionHumanPeasant=CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_WorkersUnionHumanPeasant, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_WorkersUnionHumanPeasant, Condition(function Trig_WorkersUnionHumanPeasant_Conditions))
        call TriggerAddAction(gg_trg_WorkersUnionHumanPeasant, function Trig_WorkersUnionHumanPeasant_Actions)
    endfunction
endlibrary