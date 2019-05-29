library Crushed initializer Init

    private  function Trig_Crushed_Conditions takes nothing returns boolean
        if not (GetUnitAbilityLevelSwapped('A0AG', udg_DamageEventSource) == 1) then
            return false
        endif

        if UnitHasBuffBJ(udg_DamageEventTarget, 'B006') then
            return false
        endif

        return true
    endfunction

    private  function Trig_Crushed_Actions takes nothing returns nothing
        local location loc=GetUnitLoc(udg_DamageEventTarget)
        local unit dummy=CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', loc, bj_UNIT_FACING )
        // call DestroyEffectBJ(AddSpecialEffectLocBJ( loc, "Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl" ))
        call UnitAddAbilityBJ( 'A0AH', dummy ) // Crushed
        call IssueTargetOrderBJ(dummy,"cripple",udg_DamageEventTarget)
        call UnitApplyTimedLifeBJ( 1.00, 'BTLF', dummy )
        call RemoveLocation(loc)
        set loc=null
        set dummy=null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_Crushed = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Crushed, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Crushed, Condition( function Trig_Crushed_Conditions ) )
        call TriggerAddAction( gg_trg_Crushed, function Trig_Crushed_Actions )
    endfunction



endlibrary