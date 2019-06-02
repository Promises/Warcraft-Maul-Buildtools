library DisableTowers
    private function Trig_Disable_Towers_Add_Check_Price takes unit tower returns boolean
        return GetUnitPointValue(tower) <= 10
    endfunction

    private function IsBlacklistedFromDisableTowers takes unit tower returns boolean
        if (GetUnitTypeId(tower) == 'n01D') then
            return true
        endif

        if (GetUnitTypeId(tower) == 'n01E') then
            return true
        endif

        if (GetUnitTypeId(tower) == 'n01F') then
            return true
        endif

        if (GetUnitTypeId(tower) == 'n01G') then
            return true
        endif

        if (GetUnitTypeId(tower) == 'n01I') then
            return true
        endif

        return false
    endfunction

    public function Trig_Disable_Towers_Add_Actions takes unit tower returns nothing
        if not (IsBlacklistedFromDisableTowers(tower)) then
            if Trig_Disable_Towers_Add_Check_Price(tower) then
                call GroupAddUnitSimple(tower, udg_TowerUnitGroup[GetConvertedPlayerId(GetOwningPlayer(tower))])
            endif
        endif
    endfunction

    //===========================================================================
    // function InitTrig_Disable_Towers_Add takes nothing returns nothing
    //     set gg_trg_Disable_Towers_Add = CreateTrigger(  )
    //     call TriggerRegisterAnyUnitEventBJ( gg_trg_Disable_Towers_Add, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
    //     call TriggerAddAction( gg_trg_Disable_Towers_Add, function Trig_Disable_Towers_Add_Actions )
    // endfunction

endlibrary