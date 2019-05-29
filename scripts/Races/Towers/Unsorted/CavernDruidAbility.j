library CavernDruidAbility initializer Init

    private  function Trig_Cavern_Druid_Ability_Func001C takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'h04Q'
    endfunction

    private  function Trig_Cavern_Druid_Ability_Actions takes nothing returns nothing
        set udg_DamageEventAmount = udg_DamageEventAmount + GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) * 25.00
        call SetUnitManaBJ(udg_DamageEventSource, 0.00)
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_Cavern_Druid_Ability = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Cavern_Druid_Ability, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Cavern_Druid_Ability, Condition( function Trig_Cavern_Druid_Ability_Func001C ) )
        call TriggerAddAction( gg_trg_Cavern_Druid_Ability, function Trig_Cavern_Druid_Ability_Actions )
    endfunction



endlibrary