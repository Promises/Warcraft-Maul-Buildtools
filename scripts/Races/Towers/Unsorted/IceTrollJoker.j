library IceTrollJoker initializer Init

    private  function Trig_IceTrollJoker_Conditions takes nothing returns boolean
        if not UnitHasBuffBJ(udg_DamageEventTarget, 'B02M') then
            return false
        endif

        if not (GetUnitMoveSpeed(udg_DamageEventTarget) < GetUnitDefaultMoveSpeed(udg_DamageEventTarget)) then
            return false
        endif

        return true
    endfunction

    private  function Trig_IceTrollJoker_Actions takes nothing returns nothing
        set udg_DamageEventAmount = 3.00 * udg_DamageEventAmount
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_IceTrollJoker = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_IceTrollJoker, "udg_DamageModifierEvent", EQUAL, 2.00 )
        call TriggerAddCondition( gg_trg_IceTrollJoker, Condition( function Trig_IceTrollJoker_Conditions ) )
        call TriggerAddAction( gg_trg_IceTrollJoker, function Trig_IceTrollJoker_Actions )
    endfunction



endlibrary