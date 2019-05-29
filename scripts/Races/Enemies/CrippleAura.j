library CrippleAura initializer Init

    private  function Trig_CrippleAura_Conditions takes nothing returns boolean
        if UnitHasBuffBJ(udg_DamageEventSource, 'B01C') then
            return false
        endif

        if not UnitHasBuffBJ(udg_DamageEventTarget, 'B01D') then
            return false
        endif

        if GetRandomInt(1, 100) > 10 then
            return false
        endif

        return true
    endfunction

    private  function Trig_CrippleAura_Actions takes nothing returns nothing
        local unit dummy = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'u008', 0.0, -5300.0, bj_UNIT_FACING)
        call UnitAddAbilityBJ('A06B', dummy) // Cripple
        call SetUnitAbilityLevel(dummy, 'A06B', udg_CreepLevel + 1)
        call IssueTargetOrderBJ(dummy, "cripple", udg_DamageEventSource)
        call UnitApplyTimedLifeBJ(1.00, 'BTLF', dummy)
        set dummy = null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_CrippleAura = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_CrippleAura, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_CrippleAura, Condition( function Trig_CrippleAura_Conditions ) )
        call TriggerAddAction( gg_trg_CrippleAura, function Trig_CrippleAura_Actions )
    endfunction



endlibrary