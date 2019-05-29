library VenomTower initializer Init

    private  function Trig_VenomTower_Conditions takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'h045'
    endfunction

    private  function Trig_VenomTower_Actions takes nothing returns nothing
        call IssueImmediateOrderBJ(udg_DamageEventSource, "stop")
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_VenomTower = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_VenomTower, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_VenomTower, Condition( function Trig_VenomTower_Conditions ) )
        call TriggerAddAction( gg_trg_VenomTower, function Trig_VenomTower_Actions )
    endfunction



endlibrary