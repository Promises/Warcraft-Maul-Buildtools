library VampiricAura initializer Init

    private  function Trig_VampiricAura_Conditions takes nothing returns boolean
        if not UnitHasBuffBJ(udg_DamageEventTarget, 'B01H') then
            return false
        endif

        if GetRandomInt(1, 100) > 10 then
            return false
        endif

        return true
    endfunction

    private  function Trig_VampiricAura_Actions takes nothing returns nothing
        call DestroyEffectBJ(AddSpecialEffect("Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl", GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget)))
        call SetUnitLifeBJ(udg_DamageEventTarget, GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) + 4 * udg_CreepLevel)
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_VampiricAura = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_VampiricAura, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_VampiricAura, Condition( function Trig_VampiricAura_Conditions ) )
        call TriggerAddAction( gg_trg_VampiricAura, function Trig_VampiricAura_Actions )
    endfunction



endlibrary