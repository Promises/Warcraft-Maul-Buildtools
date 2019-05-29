library SummoningShrine initializer Init

    private  function Trig_SummoningShrine_Conditions takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'n00U'
    endfunction

    private  function Trig_SummoningShrine_Actions takes nothing returns nothing
        local real x = GetUnitX(udg_DamageEventTarget)
        local real y = GetUnitY(udg_DamageEventTarget)
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', x, y, bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
        call UnitAddAbilityBJ('A06P', u)
        call IssuePointOrder(u, "dreadlordinferno", x, y)

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_SummoningShrine = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_SummoningShrine, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_SummoningShrine, Condition( function Trig_SummoningShrine_Conditions ) )
        call TriggerAddAction( gg_trg_SummoningShrine, function Trig_SummoningShrine_Actions )
    endfunction



endlibrary