library VoidBeing initializer Init

    private  function Trig_VoidBeing_Conditions takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'h00T'
    endfunction

    private  function Trig_VoidBeing_Actions takes nothing returns nothing
        call SetUnitLifeBJ(udg_DamageEventSource, GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventSource) + 2.00)
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_VoidBeing = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_VoidBeing, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_VoidBeing, Condition( function Trig_VoidBeing_Conditions ) )
        call TriggerAddAction( gg_trg_VoidBeing, function Trig_VoidBeing_Actions )
    endfunction



endlibrary