library base initializer Init

    private  function Trig_AcidSpittingSpider_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'o019') then
            return false
        endif

        if (GetRandomInt(1, 4) != 1) then
            return false
        endif

        return true
    endfunction

    private  function Trig_AcidSpittingSpider_Actions takes nothing returns nothing
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
        call UnitAddAbilityBJ('A073', u)
        call IssueTargetOrderBJ(u, "acidbomb", udg_DamageEventTarget)

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_AcidSpittingSpider = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_AcidSpittingSpider, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_AcidSpittingSpider, Condition( function Trig_AcidSpittingSpider_Conditions ) )
        call TriggerAddAction( gg_trg_AcidSpittingSpider, function Trig_AcidSpittingSpider_Actions )
    endfunction



endlibrary