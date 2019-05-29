library UndeadAcolyte initializer Init

    //===========================================================================
    // Trigger: WorkersUnionUndeadAcolyte
    //===========================================================================
    private function Trig_WorkersUnionUndeadAcolyte_Conditions takes nothing returns boolean
        if udg_DamageEventAOE != 1.00 then
            return false
        endif

        if not ( GetUnitAbilityLevel(udg_DamageEventSource, 'A09S') > 0 ) then
            return false
        endif

        return true
    endfunction

    private function Trig_WorkersUnionUndeadAcolyte_Actions takes nothing returns nothing
        call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 0) + 5, 0)
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_WorkersUnionUndeadAcolyte=CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_WorkersUnionUndeadAcolyte, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_WorkersUnionUndeadAcolyte, Condition(function Trig_WorkersUnionUndeadAcolyte_Conditions))
        call TriggerAddAction(gg_trg_WorkersUnionUndeadAcolyte, function Trig_WorkersUnionUndeadAcolyte_Actions)
    endfunction
endlibrary