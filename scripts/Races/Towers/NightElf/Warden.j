library Warden initializer Init

    private  function Trig_Warden_Conditions takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'h00G'
    endfunction

    private  function Trig_Warden_Actions takes nothing returns nothing
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
        call UnitAddAbilityBJ('A0BM', u)
        call IssueTargetOrderBJ(u, "shadowstrike", udg_DamageEventTarget)

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_Warden = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Warden, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Warden, Condition( function Trig_Warden_Conditions ) )
        call TriggerAddAction( gg_trg_Warden, function Trig_Warden_Actions )
    endfunction



endlibrary