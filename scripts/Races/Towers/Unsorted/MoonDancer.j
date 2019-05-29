library MoonDancer initializer Init

    private  function Trig_MoonDancer_Conditions takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'e00K'
    endfunction

    private  function MoonDancerCastSpell takes nothing returns nothing
        local location loc = GetUnitLoc(udg_DamageEventTarget)
        local unit dummy = CreateUnitAtLoc(GetOwningPlayer(udg_DamageEventSource), 'u008', loc, bj_UNIT_FACING )
        call UnitAddAbilityBJ( 'A022', dummy ) // Star Wave
        call IssuePointOrderLocBJ(dummy, "blizzard", loc)
        call UnitApplyTimedLifeBJ( 1.00, 'BTLF', dummy )
        call RemoveLocation(loc)
        set loc=null
        set dummy=null
    endfunction

    private  function Trig_MoonDancer_Actions takes nothing returns nothing
        local real mana = GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) + 1.00
        call SetUnitManaBJ( udg_DamageEventSource, mana )

        if(mana > 4) then
            call SetUnitManaBJ( udg_DamageEventSource, 0.00 )
            call MoonDancerCastSpell()
        endif
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_MoonDancer = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_MoonDancer, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_MoonDancer, Condition( function Trig_MoonDancer_Conditions ) )
        call TriggerAddAction( gg_trg_MoonDancer, function Trig_MoonDancer_Actions )
    endfunction



endlibrary