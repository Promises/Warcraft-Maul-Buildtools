/**
 *    A02D = Sell Ability
 *    A0EJ = Marine Force Ability
 *    Marine gets sold, selects all units in MarineGroup and decreases the level of Marine Forcce ability by 1 
 */

library MarineForce initializer Init

    globals
        private trigger gg_trg_Marine_Force_Decrease = null
        private trigger gg_trg_Marine_Force_Increase = null
    endglobals

    private function Trig_Marine_Force_Decrease_Conditions takes nothing returns boolean
        return GetSpellAbilityId() == 'A02D'
    endfunction

    private function LowerMarineGroupAbility takes nothing returns nothing
        call SetUnitAbilityLevelSwapped('A0EJ', GetEnumUnit(), CountUnitsInGroup(udg_MarineGroups[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))]))
    endfunction

    private function Trig_Marine_Force_Decrease_Actions takes nothing returns nothing
        if (GetUnitTypeId(GetSpellAbilityUnit()) == 'h02H') then
            call GroupRemoveUnitSimple(GetSpellAbilityUnit(), udg_MarineGroups[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))])
            call ForGroupBJ(udg_MarineGroups[GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))], function LowerMarineGroupAbility)
        endif
    endfunction

    private function Trig_Marine_Force_Increase_Conditions takes nothing returns boolean
        return GetUnitTypeId(GetTriggerUnit()) == 'h02H'
    endfunction

    private function Trig_Marine_Force_Increase_Func002A takes nothing returns nothing
        call SetUnitAbilityLevelSwapped('A0EJ', GetEnumUnit(), CountUnitsInGroup(udg_MarineGroups[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]))
    endfunction

    private function Trig_Marine_Force_Increase_Actions takes nothing returns nothing
        call GroupAddUnitSimple(GetTriggerUnit(), udg_MarineGroups[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))])
        call ForGroupBJ(udg_MarineGroups[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))], function Trig_Marine_Force_Increase_Func002A)
    endfunction

    private function InitTrig_Marine_Force_Decrease takes nothing returns nothing
        set gg_trg_Marine_Force_Decrease = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(gg_trg_Marine_Force_Decrease, EVENT_PLAYER_UNIT_SPELL_CAST)
        call TriggerAddCondition(gg_trg_Marine_Force_Decrease, Condition(function Trig_Marine_Force_Decrease_Conditions))
        call TriggerAddAction(gg_trg_Marine_Force_Decrease, function Trig_Marine_Force_Decrease_Actions)
    endfunction


    private function InitTrig_Marine_Force_Increase takes nothing returns nothing
        set gg_trg_Marine_Force_Increase = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(gg_trg_Marine_Force_Increase, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
        call TriggerAddCondition(gg_trg_Marine_Force_Increase, Condition( function Trig_Marine_Force_Increase_Conditions))
        call TriggerAddAction(gg_trg_Marine_Force_Increase, function Trig_Marine_Force_Increase_Actions)
    endfunction

    private function Init takes nothing returns nothing
        call InitTrig_Marine_Force_Decrease()
        call InitTrig_Marine_Force_Increase()
    endfunction



endlibrary