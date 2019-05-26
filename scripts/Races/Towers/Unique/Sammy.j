/**
 * u03F = Sammy the Kobold Shoveler
 * u040 = The Darkness
 * 
 * Sammy attacks, increases mana by 1 for each attack, when mana is 1000 replace with The Darkness
 */
library Sammy initializer Init

    globals
        private trigger gg_trg_Sammy_Mana_New = null
    endglobals

    private function Trig_Untitled_Trigger_001_Conditions takes nothing returns boolean
        if ( not ( GetUnitTypeId(udg_DamageEventSource) == 'u03F' ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Untitled_Trigger_001_Func002C takes nothing returns boolean
        if ( not ( GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) >= 1000.00 ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Untitled_Trigger_001_Actions takes nothing returns nothing
        call SetUnitManaBJ( udg_DamageEventSource, ( GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventSource) + 1.00 ) )
        if ( Trig_Untitled_Trigger_001_Func002C() ) then
            call ReplaceUnitBJ( udg_DamageEventSource, 'u040', bj_UNIT_STATE_METHOD_RELATIVE )
        else
        endif
    endfunction

    private function Init takes nothing returns nothing
        set gg_trg_Sammy_Mana_New = CreateTrigger(  )
        call TriggerRegisterVariableEvent( gg_trg_Sammy_Mana_New, "udg_DamageEvent", EQUAL, 1.00 )
        call TriggerAddCondition( gg_trg_Sammy_Mana_New, Condition( function Trig_Untitled_Trigger_001_Conditions ) )
        call TriggerAddAction( gg_trg_Sammy_Mana_New, function Trig_Untitled_Trigger_001_Actions )
    endfunction





endlibrary