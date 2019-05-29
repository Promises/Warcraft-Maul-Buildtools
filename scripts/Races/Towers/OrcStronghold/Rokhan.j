library Rokhan initializer Init

    private  function Trig_Rokhan_Conditions takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'h002'
    endfunction

    private  function Trig_Rokhan_Actions takes nothing returns nothing
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'o00H', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(5.00, 'BTLF', u)

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_Rokhan = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Rokhan, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Rokhan, Condition( function Trig_Rokhan_Conditions ) )
        call TriggerAddAction( gg_trg_Rokhan, function Trig_Rokhan_Actions )
    endfunction



endlibrary