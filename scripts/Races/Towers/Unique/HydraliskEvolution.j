/**
 *   h02L = Hydralisk
 *   A0EH = Hydralisk Damage
 *   A0EI = Hydralisk Speed
 *
 *   Hydralisk kills enemy, increase level of Hydralisk Damage and Hydralisk Speed
 */
library HydraliskEvolution initializer Init

    globals
        private trigger gg_trg_Hydralisk_Evolution = null
    endglobals
    private function Trig_Hydralisk_Evolution_Conditions takes nothing returns boolean
        return GetUnitTypeId(GetKillingUnitBJ()) == 'h02L'
    endfunction

    private function Trig_Hydralisk_Evolution_Actions takes nothing returns nothing
        if (GetUnitAbilityLevelSwapped('A0EH', GetKillingUnitBJ()) <= 50) then
        if (GetUnitAbilityLevelSwapped('A0EI', GetKillingUnitBJ()) <= 50) then
                call IncUnitAbilityLevelSwapped('A0EH', GetKillingUnitBJ())
                call IncUnitAbilityLevelSwapped('A0EI', GetKillingUnitBJ())
        endif
        endif
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_Hydralisk_Evolution = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(gg_trg_Hydralisk_Evolution, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddCondition(gg_trg_Hydralisk_Evolution, Condition( function Trig_Hydralisk_Evolution_Conditions))
        call TriggerAddAction(gg_trg_Hydralisk_Evolution, function Trig_Hydralisk_Evolution_Actions)
    endfunction



endlibrary