library Moonstorm initializer Init

    private  function Trig_Moonstorm_Conditions takes nothing returns boolean
        if not UnitHasBuffBJ(udg_DamageEventTarget, 'B01E') then
            return false
        endif

        if GetRandomInt(1, 100) > 10 then
            return false
        endif

        return true
    endfunction

    private  function Trig_Moonstorm_Actions takes nothing returns nothing
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget)))
        set udg_DamageEventAmount = udg_DamageEventAmount + 800
        // call BlzSetEventDamage(GetEventDamage() + 800)
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_Moonstorm = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Moonstorm, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Moonstorm, Condition( function Trig_Moonstorm_Conditions ) )
        call TriggerAddAction( gg_trg_Moonstorm, function Trig_Moonstorm_Actions )
    endfunction



endlibrary