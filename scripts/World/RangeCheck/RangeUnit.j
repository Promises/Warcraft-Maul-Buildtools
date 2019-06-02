library RangeUnit initializer Init
    private function Trig_Range_Unit_Func001C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Unit_Actions takes nothing returns nothing
        if ( Trig_Range_Unit_Func001C() ) then
            set udg_Range[GetConvertedPlayerId(GetTriggerPlayer())]  = BlzGetUnitWeaponRealField(GetTriggerUnit(), UNIT_WEAPON_RF_ATTACK_RANGE, 0)
        else
        endif
    endfunction

    //===========================================================================
    private function InitTrig_Range_Unit takes nothing returns nothing
        set gg_trg_Range_Unit = CreateTrigger(  )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(0), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(1), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(2), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(3), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(4), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(5), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(6), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(7), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(8), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(9), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(10), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(11), true )
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Range_Unit, Player(12), true )
        call TriggerAddAction( gg_trg_Range_Unit, function Trig_Range_Unit_Actions )
    endfunction

endlibrary