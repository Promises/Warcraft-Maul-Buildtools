library CavernTurtle initializer Init

    private  function Trig_CavernTurtle_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'h04N') then
            return false
        endif

        if not (udg_AOEDamageEvent == 0.00) then
            return false
        endif

        if not (GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) >= 100.00) then
            return false
        endif

        return true
    endfunction

    private  function Trig_CavernTurtle_Actions takes nothing returns nothing
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
        call SetUnitManaBJ(udg_DamageEventSource, (GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) - 100.00))
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
        call UnitAddAbilityBJ('A0BY', u)
        call IssueImmediateOrderBJ(u, "fanofknives")

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_CavernTurtle = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_CavernTurtle, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_CavernTurtle, Condition( function Trig_CavernTurtle_Conditions ) )
        call TriggerAddAction( gg_trg_CavernTurtle, function Trig_CavernTurtle_Actions )
    endfunction



endlibrary