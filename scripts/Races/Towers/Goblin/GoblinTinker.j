library GoblinTinker initializer Init

    private  function Trig_GoblinTinker_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'o01S') then
            return false
        endif

        if (GetRandomInt(1, 100) > 5) then
            return false
        endif

        return true
    endfunction

    private  function Trig_GoblinTinker_Actions takes nothing returns nothing
        local unit dummy=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING )
        call UnitAddAbilityBJ( 'A0B9', dummy ) // ClusterRockets
        call IssuePointOrder(dummy, "clusterrockets", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget))
        call UnitApplyTimedLifeBJ( 3.00, 'BTLF', dummy )
        set dummy=null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_GoblinTinker = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_GoblinTinker, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_GoblinTinker, Condition( function Trig_GoblinTinker_Conditions ) )
        call TriggerAddAction( gg_trg_GoblinTinker, function Trig_GoblinTinker_Actions )
    endfunction

endlibrary