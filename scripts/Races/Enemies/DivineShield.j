library DivineShield initializer Init requires SharedWorld

   

    private function Trig_DivineShield_Conditions takes nothing returns boolean
        if (SharedWorld_AirWave()) then
            return false
        endif
        return GetUnitAbilityLevel(udg_DamageEventTarget, 'A01E') > 0
    endfunction

    private  function Trig_DivineShield_Actions takes nothing returns nothing
        local integer abilvl = GetUnitAbilityLevel(udg_DamageEventTarget, 'A01E')
        set udg_DamageEventAmount = 0.00
        // call BlzSetEventDamage(0)
        if (abilvl <= 1) then
            call UnitRemoveAbility(udg_DamageEventTarget, 'A01E')
        else
            call SetUnitAbilityLevel(udg_DamageEventTarget, 'A01E', abilvl - 1)
        endif
    endfunction

    //===========================================================================
    private  function Init takes nothing returns nothing
        set gg_trg_DivineShield = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_DivineShield, "udg_DamageModifierEvent", EQUAL, 4.00 )
        call TriggerAddCondition( gg_trg_DivineShield, Condition( function Trig_DivineShield_Conditions ) )
        call TriggerAddAction( gg_trg_DivineShield, function Trig_DivineShield_Actions )
    endfunction



endlibrary