/**
 * B02O = [The Unique] Darkness (Buff)
 * 
 * If DamageEventTarget has [The Unique] Darkness (Buff) it takes 25% more damage
 */
library TheDarknessAbilityDamage initializer Init

    globals
        private trigger gg_trg_The_Darkness_Ability_Damage = null
    endglobals

    private function Trig_The_Darkness_Ability_Damage_Conditions takes nothing returns boolean
	return UnitHasBuffBJ(udg_DamageEventTarget, 'B02O')
    endfunction

    private function Trig_The_Darkness_Ability_Damage_Actions takes nothing returns nothing
        set udg_DamageEventAmount = udg_DamageEventAmount * 1.25
    endfunction

    private function Init takes nothing returns nothing
        set gg_trg_The_Darkness_Ability_Damage = CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_The_Darkness_Ability_Damage, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_The_Darkness_Ability_Damage, Condition( function Trig_The_Darkness_Ability_Damage_Conditions))
        call TriggerAddAction(gg_trg_The_Darkness_Ability_Damage, function Trig_The_Darkness_Ability_Damage_Actions)
    endfunction



endlibrary