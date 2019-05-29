library ChainLightningAttack initializer Init

    private  function Trig_ChainLightningAttack_Conditions takes nothing returns boolean
        return GetUnitAbilityLevelSwapped('A091', udg_DamageEventSource) > 0
    endfunction

    private  function Trig_ChainLightningAttack_Actions takes nothing returns nothing
        local unit dummy=CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventTarget), GetUnitY(udg_DamageEventTarget), bj_UNIT_FACING )
        call UnitAddAbilityBJ( 'A090', dummy ) // Chain Lightning
        call IssueTargetOrderBJ(dummy,"chainlightning",udg_DamageEventTarget)
        call UnitApplyTimedLifeBJ( 1.00, 'BTLF', dummy )
        set dummy=null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_ChainLightningAttack = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_ChainLightningAttack, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_ChainLightningAttack, Condition( function Trig_ChainLightningAttack_Conditions ) )
        call TriggerAddAction( gg_trg_ChainLightningAttack, function Trig_ChainLightningAttack_Actions )
    endfunction



endlibrary