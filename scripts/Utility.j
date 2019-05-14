trigger gg_trg_Voids_Fragment_Tick= null


library Utility
	public function DisplayMessageToPlayer takes string msg, integer playerid returns nothing
		call DisplayTimedTextToPlayer(Player(playerid), 0, 0, 5, msg )
	endfunction

	public function DisplayMessageToAllPlayers takes string msg returns nothing
		local integer i = 0
		loop
		exitwhen i > 12
			call DisplayMessageToPlayer(msg, i)
		set i = i + 1
		endloop
	endfunction

endlibrary

//===========================================================================
// Trigger: Voids Fragment Tick
//===========================================================================

function Trig_Voids_Fragment_Tick_Actions takes nothing returns nothing
	call Utility_DisplayMessageToAllPlayers("IT FKN WERKED")
endfunction

//===========================================================================
function InitTrig_Voids_Fragment_Tick takes nothing returns nothing
    set gg_trg_Voids_Fragment_Tick=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Voids_Fragment_Tick, 30.00)
    call TriggerAddAction(gg_trg_Voids_Fragment_Tick, function Trig_Voids_Fragment_Tick_Actions)
endfunction