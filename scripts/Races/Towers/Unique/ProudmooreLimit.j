library ProudmooreLimit initializer Init

    private function SetProudmooreLimit takes nothing returns nothing
        call SetPlayerTechMaxAllowedSwap( 'h02J', 1, GetEnumPlayer() )
    endfunction

    private function Init takes nothing returns nothing
        call ForForce( GetPlayersAll(), function SetProudmooreLimit )
    endfunction

endlibrary