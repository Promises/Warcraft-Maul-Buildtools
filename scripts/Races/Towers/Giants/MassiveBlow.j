library MassiveBlow initializer Init

    private  function Trig_MassiveBlow_Conditions takes nothing returns boolean
        if not (GetUnitAbilityLevelSwapped('A00Y', udg_DamageEventSource) == 1) then
            return false
        endif

        if UnitHasBuffBJ(udg_DamageEventTarget, 'B01J') then
            return false
        endif

        return true
    endfunction

    private  function Trig_MassiveBlow_Actions takes nothing returns nothing
        local location loc=GetUnitLoc(udg_DamageEventTarget)
        local unit dummy=CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', loc, bj_UNIT_FACING )
        // call DestroyEffectBJ(AddSpecialEffectLocBJ( loc, "Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl" ))
        call UnitAddAbilityBJ( 'A029', dummy ) // Massive Blow Slow
        call IssueTargetOrderBJ(dummy,"slow",udg_DamageEventTarget)
        call UnitApplyTimedLifeBJ( 1.00, 'BTLF', dummy )
        call RemoveLocation(loc)
        set loc=null
        set dummy=null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_MassiveBlow = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_MassiveBlow, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_MassiveBlow, Condition( function Trig_MassiveBlow_Conditions ) )
        call TriggerAddAction( gg_trg_MassiveBlow, function Trig_MassiveBlow_Actions )
    endfunction



endlibrary