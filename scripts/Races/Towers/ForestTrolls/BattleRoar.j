library BattleRoar initializer Init
    private  function Trig_BattleRoar_Conditions takes nothing returns boolean
        return UnitHasBuffBJ(udg_DamageEventTarget, 'B015')
    endfunction

    private  function Trig_BattleRoar_Actions takes nothing returns nothing
        set udg_DamageEventAmount = udg_DamageEventAmount * 1.5
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_BattleRoar = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_BattleRoar, "udg_DamageModifierEvent", EQUAL, 2.00 )
        call TriggerAddCondition( gg_trg_BattleRoar, Condition( function Trig_BattleRoar_Conditions ) )
        call TriggerAddAction( gg_trg_BattleRoar, function Trig_BattleRoar_Actions )
    endfunction



endlibrary