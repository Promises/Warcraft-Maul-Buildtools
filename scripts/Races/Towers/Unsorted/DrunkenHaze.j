library DrunkenHaze initializer Init
    private  function Trig_DrunkenHaze_Conditions takes nothing returns boolean
        return UnitHasBuffBJ(udg_DamageEventTarget, 'B018')
    endfunction

    private  function Trig_DrunkenHaze_Actions takes nothing returns nothing
        set udg_DamageEventAmount = udg_DamageEventAmount * 1.25
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_DrunkenHaze = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_DrunkenHaze, "udg_DamageModifierEvent", EQUAL, 2.00 )
        call TriggerAddCondition( gg_trg_DrunkenHaze, Condition( function Trig_DrunkenHaze_Conditions ) )
        call TriggerAddAction( gg_trg_DrunkenHaze, function Trig_DrunkenHaze_Actions )
    endfunction



endlibrary