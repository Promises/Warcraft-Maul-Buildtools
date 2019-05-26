/**
*    u03E = Zergling Hive
*    u042 = Zergling
*
*    Zergling Hive attacks, ZergChance is randomly set between 1 and 10, if 1 Spawn Zergling on Spellpoint, add expiration timer to zergling
*/
library SpawnZergling initializer Init

    globals
        private trigger gg_trg_Zergling_Spawn = null
    endglobals

    private function Trig_Zergling_Spawn_Conditions takes nothing returns boolean
	    return GetUnitTypeId(GetAttacker()) == 'u03E'
    endfunction

    private function Trig_Zergling_Spawn_Actions takes nothing returns nothing
        if (GetRandomInt(1, 10) == 1) then
            call UnitApplyTimedLifeBJ(10.00, 'BTLF', CreateUnit(GetOwningPlayer(GetAttacker()), 'u042', GetUnitX(GetAttackedUnitBJ()), GetUnitY(GetAttackedUnitBJ()), bj_UNIT_FACING))
        endif
    endfunction

    private function Init takes nothing returns nothing
        set gg_trg_Zergling_Spawn = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(gg_trg_Zergling_Spawn, EVENT_PLAYER_UNIT_ATTACKED)
        call TriggerAddCondition(gg_trg_Zergling_Spawn, Condition(function Trig_Zergling_Spawn_Conditions))
        call TriggerAddAction(gg_trg_Zergling_Spawn, function Trig_Zergling_Spawn_Actions)
    endfunction



endlibrary