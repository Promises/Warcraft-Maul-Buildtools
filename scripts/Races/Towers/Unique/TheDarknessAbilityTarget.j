/**
 * u040 = The Darkness
 * u008 = SpellDummy
 * A0EG = [Uniques] Darkness (Target)
 * 
 * The Darkness attacks enemy, create SpellDummy at SpellPoint, give SpellDummy [Uniques] Darkness (Target), Order SpellDummy to cast [Uniques] Darkness (Target) on DamageEventTarget
 */
library TheDarknessAbilityTarget initializer Init

    globals
        private trigger gg_trg_The_Darkness_Ability_Target = null
    endglobals
        
    private function Trig_The_Darkness_Ability_Target_Conditions takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'u040'
    endfunction

    private function Trig_The_Darkness_Ability_Target_Actions takes nothing returns nothing
        local unit dummy = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(2.00, 'BTLF', dummy)
        call UnitAddAbilityBJ('A0EG', dummy)
        call IssueTargetOrderBJ(dummy, "cripple", udg_DamageEventTarget)
        set dummy = null
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_The_Darkness_Ability_Target = CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_The_Darkness_Ability_Target, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_The_Darkness_Ability_Target, Condition( function Trig_The_Darkness_Ability_Target_Conditions))
        call TriggerAddAction(gg_trg_The_Darkness_Ability_Target, function Trig_The_Darkness_Ability_Target_Actions)
    endfunction





endlibrary