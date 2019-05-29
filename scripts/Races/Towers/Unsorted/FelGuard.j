library FelGuard initializer Init

    private  function Trig_FelGuard_Conditions takes nothing returns boolean
        if not ( GetUnitTypeId(udg_DamageEventSource) == 'h03W' ) then
            return false
        endif

        if ( GetRandomInt(1, 4) != 1 ) then
            return false
        endif

        return true
    endfunction

    private  function Trig_FelGuard_Actions takes nothing returns nothing
    local unit u= CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
        call UnitAddAbilityBJ('A06W', u)
        call IssuePointOrder(u, "breathoffrost", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget))

        set u=null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_FelGuard=CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_FelGuard, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_FelGuard, Condition(function Trig_FelGuard_Conditions))
        call TriggerAddAction(gg_trg_FelGuard, function Trig_FelGuard_Actions)
    endfunction


endlibrary