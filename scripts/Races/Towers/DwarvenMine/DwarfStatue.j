library DwarfStatue initializer Init

    private  function Trig_DwarfStatue_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'n05Q') then
            return false
        endif

        if (GetRandomInt(1, 100) > 3) then
            return false
        endif

        return true
    endfunction

    private  function Trig_DwarfStatue_Actions takes nothing returns nothing
        local unit u = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', u)
        call UnitAddAbilityBJ('A0AT', u)
        call IssuePointOrder(u, "shockwave", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget))

        set u = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_DwarfStatue = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_DwarfStatue, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_DwarfStatue, Condition( function Trig_DwarfStatue_Conditions ) )
        call TriggerAddAction( gg_trg_DwarfStatue, function Trig_DwarfStatue_Actions )
    endfunction



endlibrary