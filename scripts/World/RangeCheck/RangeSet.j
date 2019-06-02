library RangeSet initializer Init
    private function Trig_Range_Set_Conditions takes nothing returns boolean
        if ( not ( SubStringBJ(GetEventPlayerChatString(), 1, 7) == "-range " ) ) then
            return false
        endif
        return true
    endfunction

    private function Trig_Range_Set_Actions takes nothing returns nothing
        set udg_Range[GetConvertedPlayerId(GetTriggerPlayer())] = S2R(SubStringBJ(GetEventPlayerChatString(), 8, 11))
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set gg_trg_Range_Set = CreateTrigger(  )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(0), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(1), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(2), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(3), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(4), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(5), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(6), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(7), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(8), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(9), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(10), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(11), "-range", false )
        call TriggerRegisterPlayerChatEvent( gg_trg_Range_Set, Player(12), "-range", false )
        call TriggerAddCondition( gg_trg_Range_Set, Condition( function Trig_Range_Set_Conditions ) )
        call TriggerAddAction( gg_trg_Range_Set, function Trig_Range_Set_Actions )
    endfunction
endlibrary
