/**
 * h02K = Ancient Monstrosity
 * u008 = SpellDummy
 * A0CT = [Uniques] Acid Bomb
 *
 * Ancient Monstrosity attacks, AncientChance set between 1 and 2, if 1 create SpellDummy, add acid bomb and cast on damage target
 */
library CorrosiveResidue initializer Init

    globals
        private trigger gg_trg_Corrosive_Residue = null
    endglobals
        
    private function Trig_Corrosive_Residue_Conditions takes nothing returns boolean
        return GetUnitTypeId(udg_DamageEventSource) == 'h02K'
    endfunction

    private function CastCorrosiveResidue takes nothing returns nothing
        local unit dummy = CreateUnit(GetOwningPlayer(udg_DamageEventSource), 'u008', GetUnitX(udg_DamageEventSource), GetUnitY(udg_DamageEventSource), bj_UNIT_FACING)
        call UnitAddAbilityBJ('A0EE', dummy)
        call UnitApplyTimedLifeBJ(2.00, 'BTLF', dummy)
        call IssueTargetOrderBJ(dummy, "acidbomb", udg_DamageEventTarget)
    endfunction

    private function Trig_Corrosive_Residue_Actions takes nothing returns nothing
        if (GetRandomInt(1, 2) == 1) then
        call CastCorrosiveResidue()
        endif
    endfunction

    private function Init takes nothing returns nothing
        set gg_trg_Corrosive_Residue = CreateTrigger()
        call TriggerRegisterVariableEvent(gg_trg_Corrosive_Residue, "udg_DamageEvent", EQUAL, 1.00)
        call TriggerAddCondition(gg_trg_Corrosive_Residue, Condition(function Trig_Corrosive_Residue_Conditions))
        call TriggerAddAction(gg_trg_Corrosive_Residue, function Trig_Corrosive_Residue_Actions)
    endfunction

endlibrary