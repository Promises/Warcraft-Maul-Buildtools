library NightElfWisp initializer Init
    //===========================================================================
    // Trigger: WorkersUnionNightElfWisp
    //===========================================================================
    private function Trig_WorkersUnionNightElfWisp_Conditions takes nothing returns boolean
        if udg_DamageEventAOE != 1.00 then
            return false
        endif

        if not ( GetUnitAbilityLevel(udg_DamageEventSource, 'A09V') > 0 ) then
            return false
        endif

        return true
    endfunction

    private function Trig_WorkersUnionNightElfWisp_Actions takes nothing returns nothing
        call BlzSetUnitBaseDamage(udg_DamageEventSource, BlzGetUnitBaseDamage(udg_DamageEventSource, 0) + 40, 0)
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_WorkersUnionNightElfWisp=CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_WorkersUnionNightElfWisp, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_WorkersUnionNightElfWisp, Condition(function Trig_WorkersUnionNightElfWisp_Conditions))
        call TriggerAddAction(gg_trg_WorkersUnionNightElfWisp, function Trig_WorkersUnionNightElfWisp_Actions)
    endfunction
endlibrary