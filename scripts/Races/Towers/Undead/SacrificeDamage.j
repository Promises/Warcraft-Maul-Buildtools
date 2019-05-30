library SacrificeDamage initializer Init

    private  function Trig_SacrificeDamage_Conditions takes nothing returns boolean
        if not UnitHasBuffBJ(udg_DamageEventTarget, 'B014') then
            return false
        endif

        if udg_DamageEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) then
            return false
        endif

        return true
    endfunction

    private  function Trig_SacrificeDamage_Actions takes nothing returns nothing
    local location loc=GetUnitLoc(udg_DamageEventTarget)
    local unit dummy=CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', loc, bj_UNIT_FACING)
        call UnitAddAbilityBJ('A08P', dummy)
        call IssuePointOrderLocBJ(dummy, "rainoffire", loc)
        call UnitApplyTimedLifeBJ(3.00, 'BTLF', dummy)
        call RemoveLocation(loc)
        set loc=null
        set dummy=null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_SacrificeDamage=CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_SacrificeDamage, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_SacrificeDamage, Condition(function Trig_SacrificeDamage_Conditions))
        call TriggerAddAction(gg_trg_SacrificeDamage, function Trig_SacrificeDamage_Actions)
    endfunction

endlibrary