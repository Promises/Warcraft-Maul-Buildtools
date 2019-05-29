library MineLayer initializer Init

    private  function Trig_GoblinMineLayer_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'o01R') then
            return false
        endif

        if not (GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) >= 15.00) then
            return false
        endif

        return true
    endfunction

    private  function Trig_GoblinMineLayer_Actions takes nothing returns nothing
        local unit mine=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'h013', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING )
        call SetUnitManaBJ(udg_DamageEventSource, (GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) - 15.00))
        call UnitApplyTimedLifeBJ( 2.00, 'BTLF', mine )
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_GoblinMineLayer = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_GoblinMineLayer, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_GoblinMineLayer, Condition( function Trig_GoblinMineLayer_Conditions ) )
        call TriggerAddAction( gg_trg_GoblinMineLayer, function Trig_GoblinMineLayer_Actions )
    endfunction

endlibrary