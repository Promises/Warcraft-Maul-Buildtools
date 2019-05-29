library DrunkenBrawler initializer Init

    private  function Trig_DrunkenBrawler_Conditions takes nothing returns boolean
        return GetUnitAbilityLevelSwapped('A08U', udg_DamageEventSource) == 1
    endfunction

    private  function Trig_DrunkenBrawler_Actions takes nothing returns nothing
        local location loc=GetUnitLoc(udg_DamageEventTarget)
        local location spelloc=GetUnitLoc(udg_DamageEventSource)
        local unit dummy=CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', spelloc, bj_UNIT_FACING )
        local integer rng = GetRandomInt(1, 6)
        if(rng == 1)then
            call UnitAddAbilityBJ( 'A078', dummy ) // Dazzle
            call IssuePointOrderLocBJ(dummy,"clusterrockets", loc)
        elseif(rng == 2)then
            call UnitAddAbilityBJ( 'A00F', dummy ) // Flame Strike
            call IssuePointOrderLocBJ(dummy,"flamestrike", loc)
        elseif(rng == 3)then
            call UnitAddAbilityBJ( 'A02N', dummy ) // Impale
            call IssuePointOrderLocBJ(dummy,"impale", loc)
        elseif(rng == 4)then
            call UnitAddAbilityBJ( 'A02M', dummy ) // Carrion Swarm
            call IssuePointOrderLocBJ(dummy,"carrionswarm",loc)
        elseif(rng == 5)then
            call UnitAddAbilityBJ( 'A08P', dummy ) // Rain of Fire
            call IssuePointOrderLocBJ(dummy,"rainoffire",loc)
        else
            call UnitAddAbilityBJ( 'A00J', dummy ) // Fan of Knives
            call IssueImmediateOrderBJ(dummy,"fanofknives")
        endif
        call UnitApplyTimedLifeBJ( 3.00, 'BTLF', dummy )
        call RemoveLocation(loc)
        call RemoveLocation(spelloc)
        set loc=null
        set spelloc=null
        set dummy=null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_DrunkenBrawler = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_DrunkenBrawler, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_DrunkenBrawler, Condition( function Trig_DrunkenBrawler_Conditions ) )
        call TriggerAddAction( gg_trg_DrunkenBrawler, function Trig_DrunkenBrawler_Actions )
    endfunction



endlibrary