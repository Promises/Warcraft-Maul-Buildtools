/**
 * h02J = Admiral Proudmoore
 * u041 = Water Elemental
 * 
 * Proudmoore Tower built, create ring of elementals
*/
library ProudmooreOceanmaster

    globals
        private trigger gg_trg_Proudmoore_Oceanmaster = null
    endglobals

    private function Trig_Proudmoore_Oceanmaster_Conditions takes nothing returns boolean
        return GetUnitTypeId(GetConstructedStructure()) == 'h02J'
    endfunction

    private function SpawnSeaElemental takes integer i, unit tower returns nothing
        local location targetLoc = PolarProjectionBJ(GetUnitLoc(tower), 400.00, (I2R(i) * ( 360.00 / 8.00 )))
            call CreateUnitAtLoc(GetOwningPlayer(tower), 'u041', targetLoc, bj_UNIT_FACING)

        call RemoveLocation(targetLoc)
        set targetLoc = null
    endfunction

    public function Trig_Proudmoore_Oceanmaster_Actions takes unit tower returns nothing
        local integer i = 1
        loop
            exitwhen i > 8
            call SpawnSeaElemental(i, tower)
            set i = i + 1
        endloop
    endfunction

    // private function Init takes nothing returns nothing
    //     set gg_trg_Proudmoore_Oceanmaster = CreateTrigger(  )
    //     call TriggerRegisterAnyUnitEventBJ( gg_trg_Proudmoore_Oceanmaster, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
    //     call TriggerAddCondition( gg_trg_Proudmoore_Oceanmaster, Condition( function Trig_Proudmoore_Oceanmaster_Conditions ) )
    //     call TriggerAddAction( gg_trg_Proudmoore_Oceanmaster, function Trig_Proudmoore_Oceanmaster_Actions )
    // endfunction





endlibrary