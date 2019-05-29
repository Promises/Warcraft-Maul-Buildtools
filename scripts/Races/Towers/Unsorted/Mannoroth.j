library Mannoroth initializer Init

    private  function Trig_Mannoroth_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'o00L') then
            return false
        endif

        if (GetRandomInt(1, 3) != 1) then
            return false
        endif

        return true
    endfunction

    private  function Trig_Mannoroth_Actions takes nothing returns nothing
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
        call UnitAddAbilityBJ('A06V', u)
        call IssueImmediateOrderBJ(u, "howlofterror")

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_Mannoroth = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Mannoroth, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Mannoroth, Condition( function Trig_Mannoroth_Conditions ) )
        call TriggerAddAction( gg_trg_Mannoroth, function Trig_Mannoroth_Actions )
    endfunction



endlibrary