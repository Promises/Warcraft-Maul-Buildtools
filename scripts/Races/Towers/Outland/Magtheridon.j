library Magtheridon initializer Init
    private  function Trig_Magtheridon_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'u01C') then
            return false
        endif

        if (GetRandomInt(1, 100) > 15) then
            return false
        endif

        return true
    endfunction

    private  function Trig_Magtheridon_Actions takes nothing returns nothing
        local unit dummy=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING )
        call UnitAddAbilityBJ( 'A0DT', dummy ) // rain of fire
        call IssuePointOrder(dummy, "rainoffire", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget))
        call UnitApplyTimedLifeBJ( 3.00, 'BTLF', dummy )
        set dummy=null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_Magtheridon = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Magtheridon, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Magtheridon, Condition( function Trig_Magtheridon_Conditions ) )
        call TriggerAddAction( gg_trg_Magtheridon, function Trig_Magtheridon_Actions )
    endfunction


endlibrary