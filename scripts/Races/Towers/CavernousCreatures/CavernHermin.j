library CavernHermin initializer Init

    private  function Trig_CavernHermin_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'h04M') then
            return false
        endif

        if not udg_IsDamageSpell then
            return false
        endif

        if (GetRandomInt(1, 3) != 1) then
            return false
        endif

        return true
    endfunction

    private  function Trig_CavernHermin_Actions takes nothing returns nothing
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
        call UnitAddAbilityBJ('A0CC', u)
        call IssueTargetOrderBJ(u, "lightningshield", udg_DamageEventTarget)

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_CavernHermit = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_CavernHermit, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_CavernHermit, Condition( function Trig_CavernHermin_Conditions ) )
        call TriggerAddAction( gg_trg_CavernHermit, function Trig_CavernHermin_Actions )
    endfunction



endlibrary