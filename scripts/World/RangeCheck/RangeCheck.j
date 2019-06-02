library RangeCheck /*initializer Init*/
    private function Trig_Range_Check_Func001Func001Func001C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(0) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func002C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(1) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func003C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(2) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func004C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(3) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func005C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(4) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func006C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(5) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func007C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(6) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func008C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(7) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func009C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(8) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func010C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(9) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func011C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(10) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func012C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(11) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001Func013C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(12) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func001C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func002C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(0) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func003C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(1) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func004C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(2) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func005C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(3) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func006C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(4) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func007C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(5) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func008C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(6) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func009C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(7) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func010C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(8) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func011C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(9) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func012C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(10) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func013C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(11) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001Func002Func014C takes nothing returns boolean
        if ( not ( GetTriggerPlayer() == Player(12) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Func001C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 0 ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Check_Actions takes nothing returns nothing
        if ( Trig_Range_Check_Func001C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call CreateNUnitsAtLoc( 1, 'u04E', GetTriggerPlayer(), PolarProjectionBJ(GetPlayerStartLocationLoc(GetTriggerPlayer()), udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )), bj_UNIT_FACING )
                call SetUnitPathing( GetLastCreatedUnit(), false )
                if ( Trig_Range_Check_Func001Func002Func002C() ) then
                    set udg_RangeUnits1[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func003C() ) then
                    set udg_RangeUnits2[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func004C() ) then
                    set udg_RangeUnits3[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func005C() ) then
                    set udg_RangeUnits4[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func006C() ) then
                    set udg_RangeUnits5[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func007C() ) then
                    set udg_RangeUnits6[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func008C() ) then
                    set udg_RangeUnits7[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func009C() ) then
                    set udg_RangeUnits8[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func010C() ) then
                    set udg_RangeUnits9[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func011C() ) then
                    set udg_RangeUnits10[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func012C() ) then
                    set udg_RangeUnits11[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func013C() ) then
                    set udg_RangeUnits12[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                if ( Trig_Range_Check_Func001Func002Func014C() ) then
                    set udg_RangeUnits13[GetForLoopIndexA()] = GetLastCreatedUnit()
                else
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 1
        else
            if ( Trig_Range_Check_Func001Func001C() ) then
                if ( Trig_Range_Check_Func001Func001Func001C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits1[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func002C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits2[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func003C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits3[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func004C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits4[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func005C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits5[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func006C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits6[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func007C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits7[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func008C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits8[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func009C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits9[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func010C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits10[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func011C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits11[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func012C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits12[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
                if ( Trig_Range_Check_Func001Func001Func013C() ) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 36
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call RemoveUnit( udg_RangeUnits13[GetForLoopIndexA()] )
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] = 0
                else
                endif
            else
            endif
        endif
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_Range_Check = CreateTrigger(  )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(0), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(1), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(2), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(3), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(4), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(5), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(6), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(7), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(8), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(9), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(10), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(11), "-rc", true )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Check, Player(12), "-rc", true )
        call TriggerAddAction( gg_trg_Range_Check, function Trig_Range_Check_Actions )
    endfunction

endlibrary