library CrushedDamage initializer Init

    private  function Trig_CrushedDamage_Conditions takes nothing returns boolean
        return UnitHasBuffBJ(udg_DamageEventTarget, 'B006')
    endfunction

    private  function Trig_CrushedDamage_Actions takes nothing returns nothing
        set udg_DamageEventAmount = udg_DamageEventAmount * 1.25
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_CrushedDamage = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_CrushedDamage, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_CrushedDamage, Condition( function Trig_CrushedDamage_Conditions ) )
        call TriggerAddAction( gg_trg_CrushedDamage, function Trig_CrushedDamage_Actions )
    endfunction



endlibrary