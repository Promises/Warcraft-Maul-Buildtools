library VoidCorrupter initializer Init

    private  function Trig_VoidCorrupter_Conditions takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'h01A'
    endfunction

    private  function Trig_VoidCorrupter_Actions takes nothing returns nothing
        call BlzSetUnitArmor(udg_DamageEventTarget, BlzGetUnitArmor(udg_DamageEventTarget) - 0.25)
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_VoidCorrupter = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_VoidCorrupter, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_VoidCorrupter, Condition( function Trig_VoidCorrupter_Conditions ) )
        call TriggerAddAction( gg_trg_VoidCorrupter, function Trig_VoidCorrupter_Actions )
    endfunction



endlibrary