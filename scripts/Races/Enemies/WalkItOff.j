library WalkItOff initializer Init

    private  function Trig_WalkItOff_Conditions takes nothing returns boolean
        if not (GetUnitAbilityLevel(udg_DamageEventTarget, 'A01T') > 0) then
            return false
        endif

        if not (GetUnitMoveSpeed(udg_DamageEventTarget) < GetUnitDefaultMoveSpeed(udg_DamageEventTarget)) then
            return false
        endif

        return true
    endfunction

    private  function Trig_WalkItOff_Actions takes nothing returns nothing
        set udg_DamageEventAmount = udg_DamageEventAmount * (1.00 - 0.50 * udg_CreepLevel * 0.01)
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_WalkItOff = CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_WalkItOff, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_WalkItOff, Condition(function Trig_WalkItOff_Conditions))
        call TriggerAddAction(gg_trg_WalkItOff, function Trig_WalkItOff_Actions)
    endfunction



endlibrary