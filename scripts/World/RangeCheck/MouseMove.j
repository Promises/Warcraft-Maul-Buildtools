library MouseMoveRC /*initializer Init*/
    private function Trig_Mouse_Move_Func001C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(0) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func002C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(1) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func003C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(2) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func004C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(3) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func005C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(4) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func006C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(5) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func007C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(6) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func008C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(7) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func009C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(8) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func010C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(9) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func011C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(10) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func012C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(11) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Func013C takes nothing returns boolean
        if ( not ( udg_RangeOnOff[GetConvertedPlayerId(GetTriggerPlayer())] == 1 ) ) then
            return false
        endif
        if ( not ( GetTriggerPlayer() == Player(12) ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Mouse_Move_Actions takes nothing returns nothing
        if ( Trig_Mouse_Move_Func001C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits1[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func002C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits2[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func003C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits3[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func004C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits4[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func005C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits5[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func006C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits6[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func007C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits7[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func008C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits8[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func009C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits9[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func010C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits10[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func011C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits11[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func012C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits12[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        if ( Trig_Mouse_Move_Func013C() ) then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 36
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())] = BlzGetTriggerPlayerMousePosition()
                call SetUnitPositionLoc( udg_RangeUnits13[GetForLoopIndexA()], PolarProjectionBJ(udg_RangePoint[GetConvertedPlayerId(GetTriggerPlayer())], udg_Range[GetConvertedPlayerId(GetTriggerPlayer())], ( I2R(GetForLoopIndexA()) * ( 360.00 / 36.00 ) )) )
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_Mouse_Move = CreateTrigger(  )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(0), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(1), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(2), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(3), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(4), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(5), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(6), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(7), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(8), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(9), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(10), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(11), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerRegisterPlayerMouseEventBJ( gg_trg_Mouse_Move, Player(12), bj_MOUSEEVENTTYPE_MOVE )
        call TriggerAddAction( gg_trg_Mouse_Move, function Trig_Mouse_Move_Actions )
    endfunction

endlibrary