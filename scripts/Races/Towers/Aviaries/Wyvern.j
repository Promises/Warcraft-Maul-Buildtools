library Wyvern initializer Init

    private  function Trig_Wyvern_Conditions takes nothing returns boolean
        if udg_CreepLevel == 35 then
            return false
        endif

        if udg_CreepLevel == 36 then
            return false
        endif

        return GetUnitTypeId(udg_DamageEventSource) == 'oC60'
    endfunction

    private  function WyvernAttackGroupCondition takes nothing returns boolean
        if(GetOwningPlayer(GetEnumUnit()) == Player(13))then
            return true
        endif
        if(GetOwningPlayer(GetEnumUnit()) == Player(14))then
            return true
        endif
        if(GetOwningPlayer(GetEnumUnit()) == Player(15))then
            return true
        endif
        if(GetOwningPlayer(GetEnumUnit()) == Player(16))then
            return true
        endif

        return false
    endfunction

    private  function WyvernAttackGroup takes nothing returns nothing
        if(WyvernAttackGroupCondition())then
            call SetUnitLifeBJ(GetEnumUnit(), RMaxBJ(1.00, GetUnitStateSwap(UNIT_STATE_LIFE,GetEnumUnit()) * 0.85))
            call DestroyEffect(AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl"))
        endif
    endfunction

    private  function Trig_Wyvern_Actions takes nothing returns nothing
        local location loc=GetUnitLoc(udg_DamageEventSource)
        local group grp=GetUnitsInRangeOfLocAll(128, loc)
        call ForGroupBJ( grp, function WyvernAttackGroup )
        call DestroyGroup(grp)
        call RemoveLocation(loc)
        set grp=null
        set loc=null
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_Wyvern = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Wyvern, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Wyvern, Condition( function Trig_Wyvern_Conditions ) )
        call TriggerAddAction( gg_trg_Wyvern, function Trig_Wyvern_Actions )
    endfunction


endlibrary