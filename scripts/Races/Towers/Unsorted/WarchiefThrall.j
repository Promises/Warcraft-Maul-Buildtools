library WarchiefThrall initializer Init

    private  function Trig_WarchiefThrall_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'oC65') then
            return false
        endif

        if (GetRandomInt(1, 100) > 5) then
            return false
        endif

        return true
    endfunction

    private  function Trig_WarchiefThrall_Actions takes nothing returns nothing
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
        call UnitAddAbilityBJ('A03J', u)
        call IssueTargetOrderBJ(u, "forkedlightning", udg_DamageEventTarget)

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_WarchiefThrall = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_WarchiefThrall, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_WarchiefThrall, Condition( function Trig_WarchiefThrall_Conditions ) )
        call TriggerAddAction( gg_trg_WarchiefThrall, function Trig_WarchiefThrall_Actions )
    endfunction



endlibrary