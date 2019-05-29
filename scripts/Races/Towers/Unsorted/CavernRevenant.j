library CavernRevenant initializer Init

    private  function Trig_CavernRevenant_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'h04O') then
            return false
        endif

        if not (udg_AOEDamageEvent == 0.00) then
            return false
        endif

        if not (GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) >= 25.00) then
            return false
        endif

        return true
    endfunction

    private  function Trig_CavernRevenant_Actions takes nothing returns nothing
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'n00D', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING)
        call SetUnitManaBJ(udg_DamageEventSource, (GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) - 25.00))
        call UnitApplyTimedLifeBJ(60.00, 'BTLF', u)

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_CavernRevenant = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_CavernRevenant, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_CavernRevenant, Condition( function Trig_CavernRevenant_Conditions ) )
        call TriggerAddAction( gg_trg_CavernRevenant, function Trig_CavernRevenant_Actions )
    endfunction



endlibrary