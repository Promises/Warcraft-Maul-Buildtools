/**
 * u03F = Sammy the Kobold Shoveler
 * u040 = The Darkness
 * 
 * Sammy attacks, increases mana by 1 for each attack, when mana is 1000 replace with The Darkness
 */
library ProudmooreRemoveElementals initializer Init

    globals
        private trigger gg_trg_Proudmoore_Remove_Elementals = null
    endglobals 

    private function Trig_Proudmoore_Remove_Elementals_Conditions takes nothing returns boolean
        if ( not ( GetSpellAbilityId() == 'A02D' ) ) then
            return false
        endif
        if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'h02J' ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Proudmoore_Remove_Elementals_Func001Func001C takes nothing returns boolean
        if ( not ( GetUnitTypeId(GetEnumUnit()) == 'u041' ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Proudmoore_Remove_Elementals_Func001A takes nothing returns nothing
        if ( Trig_Proudmoore_Remove_Elementals_Func001Func001C() ) then
            call RemoveUnit( GetEnumUnit() )
        else
        endif
    endfunction

    private function Trig_Proudmoore_Remove_Elementals_Actions takes nothing returns nothing
        call ForGroupBJ( GetUnitsInRangeOfLocAll(512, GetUnitLoc(GetTriggerUnit())), function Trig_Proudmoore_Remove_Elementals_Func001A )
    endfunction

    private function Init takes nothing returns nothing
        set gg_trg_Proudmoore_Remove_Elementals = CreateTrigger(  )
        call TriggerRegisterAnyUnitEventBJ( gg_trg_Proudmoore_Remove_Elementals, EVENT_PLAYER_UNIT_SPELL_CAST )
        call TriggerAddCondition( gg_trg_Proudmoore_Remove_Elementals, Condition( function Trig_Proudmoore_Remove_Elementals_Conditions ) )
        call TriggerAddAction( gg_trg_Proudmoore_Remove_Elementals, function Trig_Proudmoore_Remove_Elementals_Actions )
    endfunction






endlibrary