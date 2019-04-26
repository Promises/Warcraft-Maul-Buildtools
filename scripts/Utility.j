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