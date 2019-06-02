
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


	public function drawRectangle takes real x1, real y1, real x2, real y2 returns nothing
		local integer i = 0
		local integer j = 0
		set i = R2I(x1)
		loop
			exitwhen i > R2I(x2)
				call AddSpecialEffect("Doodads\\Cinematic\\GlowingRunes\\GlowingRunes6.mdl", I2R(i), y1)
			set i = i + 32
		endloop
		set j = R2I(y1)
		loop
			exitwhen j > R2I(y2)
				call AddSpecialEffect("Doodads\\Cinematic\\GlowingRunes\\GlowingRunes6.mdl", x2, I2R(j))
			set j = j + 32
		endloop
		set i = R2I(x1)
		loop
			exitwhen i > R2I(x2)
				call AddSpecialEffect("Doodads\\Cinematic\\GlowingRunes\\GlowingRunes6.mdl", I2R(i), y2)
			set i = i + 32
		endloop
		set j = R2I(y1)
		loop
			exitwhen j > R2I(y2)
				call AddSpecialEffect("Doodads\\Cinematic\\GlowingRunes\\GlowingRunes6.mdl", x1, I2R(j))
			set j = j + 32
		endloop
	endfunction

endlibrary




