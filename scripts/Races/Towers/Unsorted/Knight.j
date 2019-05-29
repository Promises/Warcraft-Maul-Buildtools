library Knight initializer Init

    private  function Trig_Knight_Conditions takes nothing returns boolean
        if not (GetUnitTypeId(udg_DamageEventSource) == 'hC55') then
            return false
        endif

        if not (GetUnitStateSwap(UNIT_STATE_LIFE,udg_DamageEventTarget) + udg_DamageEventAmount > 500.00) then
            return false
        endif

        return true
    endfunction

    private  function Trig_Knight_Actions takes nothing returns nothing
        call DestroyEffect(AddSpecialEffectTargetUnitBJ("origin",udg_DamageEventTarget,"Abilities\\Spells\\NightElf\\ReviveNightElf\\ReviveNightElf.mdl"))
        call SetUnitLifeBJ(udg_DamageEventTarget,(GetUnitStateSwap(UNIT_STATE_LIFE,udg_DamageEventTarget) - 500.00))
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_Knight = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Knight, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Knight, Condition( function Trig_Knight_Conditions ) )
        call TriggerAddAction( gg_trg_Knight, function Trig_Knight_Actions )
    endfunction



endlibrary